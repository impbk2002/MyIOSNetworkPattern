//
//  CodableExtension.swift
//  
//
//  Created by pbk on 2023/01/25.
//

import Foundation
import CodableWrappers


typealias YearMonthDayJoinedCoding = CodingUses<YearMonthDayJoinedDateStaticCoder>

struct YearMonthDayJoinedDateStaticCoder: DateFormatterStaticCoder {
    static var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        formatter.locale = .current
        return formatter
    }
}
