//
//  NSDateExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 8/16/15.
//  Copyright (c) 2015 kumabook. All rights reserved.
//

import Foundation

extension NSDate {
    public var timestamp: Int64 {
        return Int64(timeIntervalSince1970 * 1000)
    }
    public var yesterDay: NSDate {
        return NSDate(timeInterval: NSTimeInterval(-1 * 24 * 60 * 60), sinceDate: self)
    }
    public static func nextDateFromComponents(components: NSDateComponents) -> NSDate? {
        let calendar = NSCalendar.currentCalendar()
        var comp = calendar.components(NSCalendarUnit.CalendarUnitYear  |
                                       NSCalendarUnit.CalendarUnitMonth |
                                       NSCalendarUnit.CalendarUnitDay   |
                                       NSCalendarUnit.CalendarUnitHour  |
                                       NSCalendarUnit.CalendarUnitMinute, fromDate: NSDate())
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
