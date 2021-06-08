//
//  Utilities.swift
//  MastersPortal
//
//  Created by HASAN CAN on 8/6/21.
//

import Foundation

func formatTimestamp(_ timestamp: String) -> String? {
    var dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
    dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
    guard let date = dateFormatter.date(from: timestamp) else { return nil }

    dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_GB")
    dateFormatter.setLocalizedDateFormatFromTemplate("dMMMyyyy")
    return dateFormatter.string(from: date)
}
