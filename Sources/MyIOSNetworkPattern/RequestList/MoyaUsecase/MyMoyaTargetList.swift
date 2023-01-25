//
//  MyMoyaTargetList.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Moya

enum MyMoyaTargetList {
    
    
    struct JsonEchoTarget: TargetType, Encodable {
        var baseURL: URL { URL(string: "https://httpbin.org").unsafelyUnwrapped }
        
        var path: String { method.rawValue.lowercased() }
        
        var method: Moya.Method { .post }
        
        var task: Moya.Task {
            .requestJSONEncodable(self)
        }
        
        var headers: [String : String]? { nil }
        
        var validationType: ValidationType { .successCodes }
        
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
    
    struct QueryEchoTarget: TargetType {
        
        var baseURL: URL { URL(string: "https://httpbin.org").unsafelyUnwrapped }
        
        var path: String { method.rawValue.lowercased() }
        
        var method: Moya.Method { .get }
        var headers: [String : String]? { nil }
        var validationType: ValidationType { .successCodes }
        
        var task: Task {
            .requestParameters(parameters: [
                "userName":userName,
                "isSomething":isSomething,
                
                "userDefinedParameter1":userDefinedParameter1,
                "userDefinedParameter2":userDefinedParameter2,
                "userDefinedParameter3":userDefinedParameter3,
                "locale": locale,

                "userDefinedArray1": userDefinedArray1
            ], encoding: URLEncoding.queryString)
        }
        
        var userName:String
        var isSomething:Bool

        @YearMonthDayJoinedCoding
        var requestDate = Date()
        
        var userDefinedParameter1 = 100
        var userDefinedParameter2 = -100.0
        var userDefinedParameter3 = "stub"
        var locale = Locale.current.identifier
        var userDefinedArray1:[String] = ["A", "B", "C"]
    }
    
}
