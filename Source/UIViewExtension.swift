//
//  UIViewExtension.swift
//  Breit
//
//  Created by Hiroki Kumamoto on 8/16/15.
//  Copyright (c) 2015 kumabook. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    public func move(x: CGFloat, y: CGFloat) {
        frame.origin = CGPoint(x: frame.origin.x + x, y: frame.origin.y + y)
    }
}
