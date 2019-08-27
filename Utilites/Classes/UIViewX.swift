import UIKit
import QuartzCore

@objc public extension UIView {
    // MARK: - Basic Properties
    
    /// X Axis value of UIView.
    @objc public var lj_x: CGFloat {
        set { self.frame = CGRect(x: _pixelIntegral(newValue),
                                  y: self.lj_y,
                                  width: self.lj_width,
                                  height: self.lj_height)
        }
        get { return self.frame.origin.x }
    }
    
    /// Y Axis value of UIView.
    @objc public var lj_y: CGFloat {
        set { self.frame = CGRect(x: self.lj_x,
                                  y: _pixelIntegral(newValue),
                                  width: self.lj_width,
                                  height: self.lj_height)
        }
        get { return self.frame.origin.y }
    }
    
    /// Width of view.
    @objc public var lj_width: CGFloat {
        set { self.frame = CGRect(x: self.lj_x,
                                  y: self.lj_y,
                                  width: _pixelIntegral(newValue),
                                  height: self.lj_height)
        }
        get { return self.frame.size.width }
    }
    
    /// Height of view.
    @objc public var lj_height: CGFloat {
        set { self.frame = CGRect(x: self.lj_x,
                                  y: self.lj_y,
                                  width: self.lj_width,
                                  height: _pixelIntegral(newValue))
        }
        get { return self.frame.size.height }
    }
    
    // MARK: - Origin and Size
    
    /// View's Origin point.
    @objc public var lj_origin: CGPoint {
        set { self.frame = CGRect(x: _pixelIntegral(newValue.x),
                                  y: _pixelIntegral(newValue.y),
                                  width: self.lj_width,
                                  height: self.lj_height)
        }
        get { return self.frame.origin }
    }
    
    /// View's size.
    @objc public var lj_size: CGSize {
        set { self.frame = CGRect(x: self.lj_x,
                                  y: self.lj_y,
                                  width: _pixelIntegral(newValue.width),
                                  height: _pixelIntegral(newValue.height))
        }
        get { return self.frame.size }
    }
    
    // MARK: - Extra Properties
    
    /// View's right side (x + width).
    @objc public var lj_right: CGFloat {
        set { self.lj_x = newValue - self.lj_width }
        get { return self.lj_x + self.lj_width }
    }
    
    /// View's bottom (y + height).
    @objc public var lj_bottom: CGFloat {
        set { self.lj_y = newValue - self.lj_height }
        get { return self.lj_y + self.lj_height }
    }
    
    /// View's top (y).
    @objc public var lj_top: CGFloat {
        set { self.lj_y = newValue }
        get { return self.lj_y }
    }
    
    /// View's left side (x).
    @objc public var lj_left: CGFloat {
        set { self.lj_x = newValue }
        get { return self.lj_x }
    }
    
    /// View's center X value (center.x).
    @objc public var lj_centerX: CGFloat {
        set { self.center = CGPoint(x: newValue, y: self.lj_centerY) }
        get { return self.center.x }
    }
    
    /// View's center Y value (center.y).
    @objc public var lj_centerY: CGFloat {
        set { self.center = CGPoint(x: self.lj_centerX, y: newValue) }
        get { return self.center.y }
    }
    
    /// Last subview on X Axis.
    @objc public var lastSubviewOnX: UIView? {
        return self.subviews.reduce(UIView(frame: .zero)) {
            return $1.lj_x > $0.lj_x ? $1 : $0
        }
    }
    
    /// Last subview on Y Axis.
    @objc public var lastSubviewOnY: UIView? {
        return self.subviews.reduce(UIView(frame: .zero)) {
            return $1.lj_y > $0.lj_y ? $1 : $0
        }
    }
    
    // MARK: - Bounds Methods
    
    /// X value of bounds (bounds.origin.x).
    @objc public var boundsX: CGFloat {
        set { self.bounds = CGRect(x: _pixelIntegral(newValue),
                                   y: self.boundsY,
                                   width: self.boundsWidth,
                                   height: self.boundsHeight)
        }
        get { return self.bounds.origin.x }
    }
    
    /// Y value of bounds (bounds.origin.y).
    @objc public var boundsY: CGFloat {
        set { self.frame = CGRect(x: self.boundsX,
                                  y: _pixelIntegral(newValue),
                                  width: self.boundsWidth,
                                  height: self.boundsHeight)
        }
        get { return self.bounds.origin.y }
    }
    
    /// Width of bounds (bounds.size.width).
    @objc public var boundsWidth: CGFloat {
        set { self.frame = CGRect(x: self.boundsX,
                                  y: self.boundsY,
                                  width: _pixelIntegral(newValue),
                                  height: self.boundsHeight)
        }
        get { return self.bounds.size.width }
    }
    
    /// Height of bounds (bounds.size.height).
    @objc public var boundsHeight: CGFloat {
        set { self.frame = CGRect(x: self.boundsX,
                                  y: self.boundsY,
                                  width: self.boundsWidth,
                                  height: _pixelIntegral(newValue))
        }
        get { return self.bounds.size.height }
    }
    
    // MARK: - Useful Methods
    
    /// Center view to it's parent view.
    @objc public func centerToParent() {
        guard let superview = self.superview else { return }
        
        switch UIApplication.shared.statusBarOrientation {
        case .landscapeLeft, .landscapeRight:
            self.lj_origin = CGPoint(x: (superview.lj_height / 2) - (self.lj_width / 2),
                                  y: (superview.lj_width / 2) - (self.lj_height / 2))
        case .portrait, .portraitUpsideDown:
            self.lj_origin = CGPoint(x: (superview.lj_width / 2) - (self.lj_width / 2),
                                  y: (superview.lj_height / 2) - (self.lj_height / 2))
        case .unknown:
            return
        }
    }
    
    // MARK: - Private Methods
    fileprivate func _pixelIntegral(_ pointValue: CGFloat) -> CGFloat {
        let scale = UIScreen.main.scale
        return (round(pointValue * scale) / scale)
    }
}


@IBDesignable @objc public extension UIView {
    
    @IBInspectable var lj_cornerRadius: CGFloat {
        get {
            return self.layer.cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var lj_borderColor: UIColor? {
        get {
            return UIColor(cgColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue?.cgColor
        }
    }
    
    @IBInspectable var lj_borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    
}

@objc public extension UIView {
    
    @objc public func roundCorner(rectCorner:UIRectCorner = .allCorners,radius:CGFloat) -> Void {
        let rect = self.bounds
        let maskPath = UIBezierPath(roundedRect: rect, byRoundingCorners: rectCorner, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
}

@objc public extension UIView {
    @objc public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
    @objc public func removeSubviews() {
        subviews.forEach({ $0.removeFromSuperview() })
    }
}

/*parent view*/
extension UIView {
    public func parentView<T: UIView>(of type: T.Type) -> T? {
        guard let view = self.superview else {
            return nil
        }
        return (view as? T) ?? view.parentView(of: T.self)
    }
}
