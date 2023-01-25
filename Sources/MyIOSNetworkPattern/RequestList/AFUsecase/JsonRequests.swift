//
//  JsonRequests.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Alamofire
import CodableWrappers

extension HTTPRequestList {
    
    struct JsonEchoRequest: DataRequestFormProtocol, BinDomainFormProtocol, Encodable {
        
        var path: String { method.rawValue.lowercased() }
        var method: HTTPMethod { .post }
        var validation: DataRequest.Validation? { nil }
        var encoder: ParameterEncoder { JSONParameterEncoder.default }
        
        var userName:String
        var isSomething:Bool

        @YearMonthDayJoinedCoding
        var requestDate = Date()
        
        var userDefinedParameter1 = 100
        var userDefinedParameter2 = -100.0
        var userDefinedParameter3 = "stub"
        var locale = Locale.current.identifier
        var calendarIdentifier = Calendar.current.identifier
        var userDefinedDictionary1:[String:String] = ["A":"B", "C":"D","ASDXC":"123485","Korean":"Seoul"]
        
    }
    
    
}


