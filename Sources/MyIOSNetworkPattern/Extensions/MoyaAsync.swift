//
//  MoyaAsync.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Moya


extension MoyaProviderType {
    
    func perform(_ target:Target) async -> Result<Moya.Response, Moya.MoyaError> {
        let tokenRef = UnsafeMutablePointer<MoyaToken>.allocate(capacity: 1)
        let lock = NSLock()
        defer { tokenRef.deallocate() }
        tokenRef.initialize(to: .init())
        defer { tokenRef.deinitialize(count: 1) }
        return await withTaskCancellationHandler {
            await withUnsafeContinuation{ continuation in
                let cancellable = request(target, callbackQueue: nil, progress: nil) { continuation.resume(returning: $0) }
                lock.withLock{
                    // current task called cancellation before continuation acquire the lock
                    if tokenRef.pointee.isCancelled {
                        return cancellable as Moya.Cancellable?
                    } else {
                        // current task is not yet cancelled
                        tokenRef.pointee = .init(token:cancellable)
                        return nil as Moya.Cancellable?
                    }
                }?.cancel()
            }
        } onCancel: {
            lock.withLock{
                let oldValue = tokenRef.pointee.token
                // mark the placeholder cancelled
                tokenRef.pointee = .init(isCancelled: true)
                return oldValue
            }?.cancel()
        }
    }
    
}

extension MoyaProviderType where Target == MultiTarget {
    
    func perfomMultiTarget(_ target: some TargetType) async -> Result<Moya.Response, Moya.MoyaError> {
        await perform(.target(target))
    }
    
}

fileprivate struct MoyaToken {
    
    var isCancelled = false
    var token:Moya.Cancellable? = nil

}
