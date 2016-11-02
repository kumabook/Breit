//
//  NSDateExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 8/16/15.
//  Copyright (c) 2015 kumabook. All rights reserved.
//

import Foundation


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

    public var passedTime: String {
        let now           = Date()
        let passed        = now.timeIntervalSince(self)
        let minute: Int   = Int(passed) / 60
        if minute <= 1 {
            return "1 minute ago"
        }
        if minute < 60 {
            return "\(minute)" + " minutes ago"
        }
        let hour = minute / 60;
        if hour <= 1 {
            return "\(hour)" + " hour ago"
        }
        if (hour < 24) {
            return "\(hour)" + " hours ago"
        }
        let day = hour / 24;
        if day <= 1 {
            return "\(day)" + " day ago"
        }
        return "\(day)" + " days ago"
    }
}
