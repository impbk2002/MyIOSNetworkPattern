//
//  DataRequestFormProtocol.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Alamofire

protocol DataRequestFormProtocol: RequestFormProtocol, Sendable {

    var encoder:ParameterEncoder { get }
    var validation:DataRequest.Validation? { get }
    
}

extension DataRequestFormProtocol {
    
    var validation:DataRequest.Validation? { nil }
    
    var encoder:ParameterEncoder {
        let formatter = DateFormatter()
        formatter.locale = .autoupdatingCurrent
        formatter.dateFormat = "yyyyMMdd"
        let URLEncoder = URLEncodedFormEncoder(arrayEncoding: .noBrackets, dateEncoding: .formatted(formatter))
        return URLEncodedFormParameterEncoder(encoder: URLEncoder)
    }

}

extension DataRequestFormProtocol where Self: Encodable {
    
    func asURLRequest() throws -> URLRequest {
        try encoder.encode(self, into: baseRequest)
    }
    
}

