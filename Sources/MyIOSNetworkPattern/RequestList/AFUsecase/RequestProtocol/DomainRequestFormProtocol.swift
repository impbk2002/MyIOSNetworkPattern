//
//  DomainRequestFormProtocol.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import Alamofire

protocol BinDomainFormProtocol: RequestFormProtocol { }

extension BinDomainFormProtocol {
    var base: String { "https://httpbin.org" }
}
