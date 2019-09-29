//
//  UITabBarX.swift
//  Utilites
//
//  Created by LeonJing on 2018/10/24.
//

import UIKit

@objc public extension UITabBar {
    @objc func hideTopLine(){
        findLineImageViewIn(view: self)?.isHidden = true
    }
    @objc func showTopLine(){
        findLineImageViewIn(view: self)?.isHidden = false
    }
    
    private func findLineImageViewIn(view:UIView) -> UIImageView? {
        if let iv = view as? UIImageView, iv.frame.height <= 1.0 {
            return iv
        }
        
        for v in view.subviews {
            if let iv = findLineImageViewIn(view: v) {
                return iv
            }
        }
        
        return nil
    }
}
