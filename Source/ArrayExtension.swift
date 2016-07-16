//
//  ArrayExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 7/16/16.
//  Copyright © 2016 kumabook. All rights reserved.
//

import Foundation

extension Array {
    public func get(index: Int) -> Element? {
        if 0 <= index && index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}