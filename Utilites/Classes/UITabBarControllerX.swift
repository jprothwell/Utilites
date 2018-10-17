import UIKit

@objc public extension UITabBarController {
    
    @discardableResult
    @objc public func replaceViewController(_ viewController:UIViewController, atIndex index:(Int)) -> Bool {
        var ret = false
        if let vcs = self.viewControllers, vcs.count > index {
            var nvcs = self.viewControllers!
            nvcs.remove(at: index)
            
            self.viewControllers = nvcs
            
            ret = true
        }
        return ret
    }
}
