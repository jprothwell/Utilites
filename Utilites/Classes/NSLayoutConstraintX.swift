//
//  NSLayoutConstraintX.swift
//  Utilites
//
//  Created by LeonJing on 2018/10/29.
//

import Foundation

extension NSLayoutConstraint {
    @IBInspectable var pixelConstant: Int {
        get {
            return Int(constant * UIScreen.main.scale)
        }
        set {
            constant = CGFloat(newValue) / UIScreen.main.scale
        }
    }
}
