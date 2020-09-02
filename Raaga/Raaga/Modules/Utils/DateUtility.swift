//
//  DateUtility.swift
//  Raaga
//
//  Created by Bathi Babu on 02/09/20.
//  Copyright © 2020 Bathi Babu. All rights reserved.
//

import Foundation

protocol DateFormatterProtocol {
    
    func convertToDate(dateString: String,format:DateFormatType) -> Date?
}

enum DateFormatType: String {
        
    case dateTimeTimeZone = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
    
    case monthDayYear = "MMM d, yyyy"

}

class DateUtility: DateFormatterProtocol {
    
    /// Convert String to Date
    func convertToDate(dateString: String,format:DateFormatType) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = format.rawValue
        let serverDate: Date? = dateFormatter.date(from: dateString)
        return serverDate
    }
    
    /// Convert Date to String
    func convertToString(date: Date, dateformat formatType: DateFormatType) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = formatType.rawValue
        let newDate: String = dateFormatter.string(from: date)
        return newDate
    }
}
