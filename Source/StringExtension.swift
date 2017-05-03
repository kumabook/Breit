//
//  StringExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 8/16/15.
//  Copyright (c) 2015 kumabook. All rights reserved.
//

import Foundation

extension String {
    public func localize(_ tableName: String, bundle: Bundle) -> String {
        return NSLocalizedString(self, tableName: tableName,
                                          bundle: bundle,
                                           value: self,
                                         comment: self)
    }

    public func localize(_ tableName: String) -> String {
        return localize(tableName, bundle: Bundle.main)
    }

    public func localize(_ bundle: Bundle) -> String {
        return localize("Localizable", bundle: bundle)
    }
    
    public func localize() -> String {
        return localize("Localizable", bundle: Bundle.main)
    }
    
    public func toURL() -> URL? {
        if let url = URL(string: self) {
            return url
        } else if let str = addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            return URL(string: str)
        }
        return nil
    }

    public func contains(_ string: String) -> Bool {
        return range(of: string, options: [], range: nil, locale: Locale.autoupdatingCurrent) != nil
    }

    public func replace(_ target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }

    public var dateFromISO8601: Date? {
        return Date.iso8601Formatter.date(from: self)
    }
}
