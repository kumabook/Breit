//
//  NSDateExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 8/16/15.
//  Copyright (c) 2015 kumabook. All rights reserved.
//

import Foundation


extension Int64 {
    public var date: NSDate {
        return NSDate(timeIntervalSince1970: NSTimeInterval(Double(self)/1000))
    }
}

extension NSDate {
    public var timestamp: Int64 {
        return Int64(timeIntervalSince1970 * 1000)
    }
    public var yesterDay: NSDate {
        return NSDate(timeInterval: NSTimeInterval(-1 * 24 * 60 * 60), sinceDate: self)
    }
    public static func nextDateFromComponents(components: NSDateComponents) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        let comp = calendar.components([NSCalendarUnit.Year,
                                        NSCalendarUnit.Month,
                                        NSCalendarUnit.Day,
                                        NSCalendarUnit.Hour,
                                        NSCalendarUnit.Minute], fromDate: NSDate())
        comp.hour   = components.hour
        comp.minute = components.minute
        comp.second = 0
        if let date = calendar.dateFromComponents(comp) {
            if date.timeIntervalSinceNow > 0 {
                return date
            }
            comp.day = comp.day + 1
            return calendar.dateFromComponents(comp)!
        }
        return nil
    }

    public var passedTime: String {
        let now           = NSDate()
        let passed        = now.timeIntervalSinceDate(self)
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
