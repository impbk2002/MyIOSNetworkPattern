//
//  RequestFormProtocol.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Alamofire

protocol RequestFormProtocol: URLRequestConvertible {
    var base:String { get }
    var path:String { get }
    var method:HTTPMethod { get }
}

extension RequestFormProtocol {
    
    func asURLRequest() throws -> URLRequest {
        try baseRequest
    }
    
    var baseRequest:URLRequest {
        get throws {
            let url = try base.asURL().appendingPathComponent(path)
            var request = URLRequest(url: url)
            request.method = method
            return request
        }
    }
    
}


