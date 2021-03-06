//
//  UINavigationBarX.swift
//  Utilites
//
//  Created by LeonJing on 2018/10/24.
//

import UIKit

@objc public extension UINavigationBar {
    @objc func hideBottomLine(){
        findLineImageViewIn(view: self)?.isHidden = true
    }
    @objc func showBottomLine(){
        findLineImageViewIn(view: self)?.isHidden = false
    }
    
    @objc func makeTransparent(){
        self.isTranslucent = true
        self.setBackgroundImage(UIImage(), for: .default)
        self.backgroundColor = .clear
        self.shadowImage = UIImage()
    }
    @objc func makeDefault(){
        self.isTranslucent = false
        self.setBackgroundImage(nil, for: .default)
        self.backgroundColor = nil
        self.shadowImage = nil
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
