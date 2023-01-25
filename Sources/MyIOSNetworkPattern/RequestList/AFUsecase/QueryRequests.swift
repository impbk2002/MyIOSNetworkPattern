//
//  QueryRequests.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Alamofire
import CodableWrappers
import Moya

extension HTTPRequestList {
    
    
    struct NaverSearchDocumentRequest: DataRequestFormProtocol, Encodable {
        
        var validation: DataRequest.Validation? { nil }
        var method: HTTPMethod { .get }
        var base: String { "https://search.naver.com" }
        var path: String { "search.naver" }
        
        var query:String
        
    }
    
    
    struct GoogleSearchDocumentRequest: DataRequestFormProtocol, Encodable {
        var validation: DataRequest.Validation? { nil }
        var method: HTTPMethod { .get }
        var base: String { "https://google.com" }
        var path: String { "search" }
        
        var q:String
        
    }
    
    struct FlickrPhotoRequest: DataRequestFormProtocol, Encodable {
        
        var validation: DataRequest.Validation? { nil }
        var method: HTTPMethod { .get }
        var base: String { "https://api.flickr.com" }
        var path: String { "services/feeds/photos_public.gne" }
        var encoder: ParameterEncoder { URLEncodedFormParameterEncoder.default }
        let format = "json"
        let nojsoncallback = true
        
    }
    
    struct QueryEchoRequest: DataRequestFormProtocol, BinDomainFormProtocol, Encodable {
        
        var path: String { method.rawValue.lowercased() }
        var method: HTTPMethod { .get }
        var validation: DataRequest.Validation? { nil }
        var encoder: ParameterEncoder { URLEncodedFormParameterEncoder.default }
        
        var userName:String
        var isSomething:Bool

        @YearMonthDayJoinedCoding
        var requestDate = Date()
        
        var userDefinedParameter1 = 100
        var userDefinedParameter2 = -100.0
        var userDefinedParameter3 = "stub"
        var locale = Locale.current.identifier
        var calendarIdentifier = Calendar.current.identifier
        var userDefinedArray1:[String] = ["A", "B", "C"]
    
    }
    
}
