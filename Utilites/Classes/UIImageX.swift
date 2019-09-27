//
//  UIImageX.swift
//  Utilites
//
//  Created by LeonJing on 2018/11/1.
//

import UIKit

@objc public extension UIImage {
    
    @objc func withInsets(insetDimen: CGFloat) -> UIImage {
        return withInsets(insets: UIEdgeInsets(top: insetDimen, left: insetDimen, bottom: insetDimen, right: insetDimen))
    }
    
    @objc func withInsets(insets: UIEdgeInsets) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(
            CGSize(
                width: self.size.width + insets.left + insets.right,
                height: self.size.height + insets.top + insets.bottom
            ), false, self.scale
        )
        
        let origin = CGPoint(x: insets.left, y: insets.top)
        self.draw(at: origin)
        let imageWithInsets = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return imageWithInsets!
    }
    
    @objc func resizeToFit(in size:CGSize) -> UIImage? {
        let srcSize = self.size
        var dstSize = CGSize.zero
        var boundingSize = size
        switch imageOrientation {
        case .left,.right,.leftMirrored,.rightMirrored:
            boundingSize = CGSize(width: size.height, height: size.width)
        default:
            break
        }
        
        let wRatio:CGFloat = boundingSize.width / srcSize.width
        let hRatio:CGFloat = boundingSize.height / srcSize.height
        
        if (wRatio < hRatio) {
            dstSize = CGSize(width: boundingSize.width, height: CGFloat(floorf(Float(srcSize.height * wRatio))))
        } else {
            dstSize = CGSize(width: CGFloat(floorf(Float(srcSize.width * hRatio))), height: boundingSize.height)
        }
        
        return resize(size:dstSize)
    }
    
    @objc func resize(size:CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, self.scale)

        draw(in: CGRect(origin: .zero, size: size))
        
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizedImage
    }
    
    convenience init(pixelColor: UIColor) {
        let size = CGSize(width: 1, height: 1)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 1)

        defer {
            UIGraphicsEndImageContext()
        }

        pixelColor.setFill()
        UIRectFill(CGRect(origin: .zero, size: size))

        guard let aCgImage = UIGraphicsGetImageFromCurrentImageContext()?.cgImage else {
            self.init()
            return
        }

        self.init(cgImage: aCgImage)
    }
    
}
