//
//  DateExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 8/16/15.
//  Copyright (c) 2015 kumabook. All rights reserved.
//

import Foundation

public enum TimeUnit: String {
    case second = "second"
    case minute = "minute"
    case hour   = "hour"
    case day    = "day"
}

extension Int64 {
    public var date: Date {
        return Date(timeIntervalSince1970: TimeInterval(Double(self)/1000))
    }
}

extension Date {
    public var timestamp: Int64 {
        return Int64(timeIntervalSince1970 * 1000)
    }
    public var yesterDay: Date {
        return Date(timeInterval: TimeInterval(-1 * 24 * 60 * 60), since: self)
    }

    public static func nextDateFromComponents(_ components: DateComponents) -> Date? {
        let calendar = Calendar.current
        var comp = (calendar as NSCalendar).components([NSCalendar.Unit.year,
                                        NSCalendar.Unit.month,
                                        NSCalendar.Unit.day,
                                        NSCalendar.Unit.hour,
                                        NSCalendar.Unit.minute], from: Date())
        comp.hour   = components.hour
        comp.minute = components.minute
        comp.second = 0
        if let date = calendar.date(from: comp) {
            if date.timeIntervalSinceNow > 0 {
                return date
            }
            comp.day = comp.day! + 1
            return calendar.date(from: comp)!
        }
        return nil
    }

    public var elapsedTime: (value: Int, unit: TimeUnit) {
        let now           = Date()
        let second        = Int(now.timeIntervalSince(self))
        let minute: Int   = second / 60
        if minute < 1 {
            return (value: Int(second), unit: .second)
        }
        if minute < 60 {
            return (value: minute, unit: .minute)
        }
        let hour = minute / 60;
        if (hour < 24) {
            return (value: hour, unit: .hour)
        }
        let day = hour / 24;
        return (value: day, unit: .day)
    }

    static let iso8601Formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone(secondsFromGMT: 0)
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()

    var iso8601: String {
        return Date.iso8601Formatter.string(from: self)
    }
}
