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
}
