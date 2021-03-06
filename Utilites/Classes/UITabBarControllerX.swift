import UIKit

@objc public extension UITabBarController {
    
    @discardableResult
    @objc func replaceViewController(_ viewController:UIViewController, atIndex index:(Int)) -> Bool {
        var ret = false
        if let vcs = self.viewControllers, vcs.count > index {
            
            var nvcs = self.viewControllers!
            
            nvcs[index] = viewController
            
            self.viewControllers = nvcs
            
            ret = true
        }
        return ret
    }
    
    @discardableResult
    @objc func insertViewController(_ viewController:UIViewController, atIndex index:(Int)) -> Bool {
        var ret = false
        if let vcs = self.viewControllers, vcs.count >= index {
            
            var nvcs = self.viewControllers!
            
            nvcs.insert(viewController, at: index)
            
            self.viewControllers = nvcs
            
            ret = true
        }
        return ret
    }
    
    @discardableResult
    @objc func removeViewController(atIndex index:(Int)) -> Bool {
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
