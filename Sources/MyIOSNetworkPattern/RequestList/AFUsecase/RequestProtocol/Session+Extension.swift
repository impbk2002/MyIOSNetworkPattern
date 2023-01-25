//
//  Session+Extension.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Alamofire


extension Session {
    
    final func formRequest(_ form:DataRequestFormProtocol, interceptor: RequestInterceptor? = nil) -> DataRequest {
        var dataRequest = self.request(form, interceptor: interceptor)
        if let validator = form.validation {
            dataRequest = dataRequest.validate(validator)
        }
        return dataRequest
    }
    
    
}
