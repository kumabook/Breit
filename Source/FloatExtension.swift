//
//  FloatExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 8/16/15.
//  Copyright (c) 2015 kumabook. All rights reserved.
//

import Foundation

extension Float {
    public var prettyTime: String {
        return String(format:"%02d:%02d", Int(floor(self / 60)), Int(floor(self.truncatingRemainder(dividingBy: 60))))
    }
}
