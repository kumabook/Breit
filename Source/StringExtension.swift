//
//  StringExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 8/16/15.
//  Copyright (c) 2015 kumabook. All rights reserved.
//

import Foundation

extension String {
    public func localize(#tableName: String, bundle: NSBundle) -> String {
        return NSLocalizedString(self, tableName: tableName,
                                          bundle: bundle,
                                           value: self,
                                         comment: self)
    }

    public func localize(#tableName: String) -> String {
        return localize(tableName: tableName, bundle: NSBundle.mainBundle())
    }

     public func localize(#bundle: NSBundle) -> String {
        return localize(tableName: "Localizable", bundle: bundle)
    }
    
    public func localize() -> String {
        return localize(tableName: "Localizable", bundle: NSBundle.mainBundle())
    }
    
    public func toURL() -> NSURL? {
        if let url = NSURL(string: self) {
            return url
        } else if let str = stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet()) {
            return NSURL(string: str)
        }
        return nil
    }

    public func contains(string: String) -> Bool {
        return rangeOfString(string, options: .allZeros, range: nil, locale: NSLocale.autoupdatingCurrentLocale()) != nil
    }
}