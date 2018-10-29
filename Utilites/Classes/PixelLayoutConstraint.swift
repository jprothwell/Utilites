//
//  PixelLayoutConstraint.swift
//  Utilites_Example
//
//  Created by LeonJing on 2018/10/29.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class PixelLayoutConstraint: NSLayoutConstraint {
    @IBInspectable var pixelConstant: Int {
        get {
            return Int(constant * UIScreen.main.scale)
        }
        set {
            constant = CGFloat(newValue) / UIScreen.main.scale
        }
    }
}
