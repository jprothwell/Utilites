import UIKit


// MARK:  sysetem version
public struct iOSVersion {
    
    public static let IOS7Before   = UIDevice.SYSTEM_VERSION_LESS_THAN("7.0")
    
    public static let IOS7         = UIDevice.SYSTEM_VERSION_LESS_THAN("8.0") && UIDevice.SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("7.0")
    public static let IOS8         = UIDevice.SYSTEM_VERSION_LESS_THAN("9.0") && UIDevice.SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("8.0")
    public static let IOS9         = UIDevice.SYSTEM_VERSION_LESS_THAN("10.0") && UIDevice.SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("9.0")
    
    public static let IOS9Later    = UIDevice.SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO("9.0")
    
}

/** Model Extends UIDevice */
@objc public extension UIDevice {
    
    //systeme version compare methods
    
    @objc class func SYSTEM_VERSION_EQUAL_TO(_ version: String) -> Bool {
        return self.current.systemVersion.compare(version as String,
                                                  options: .numeric) == .orderedSame
    }
    
    @objc class func SYSTEM_VERSION_GREATER_THAN(_ version: String) -> Bool {
        return self.current.systemVersion.compare(version as String,
                                                  options: .numeric) == .orderedDescending
    }
    
    @objc class func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(_ version: String) -> Bool {
        return self.current.systemVersion.compare(version as String,
                                                  options: .numeric) != .orderedAscending
    }
    
    @objc class func SYSTEM_VERSION_LESS_THAN(_ version: String) -> Bool {
        return UIDevice.current.systemVersion.compare(version as String,
                                                      options: .numeric) == .orderedAscending
    }
    
    @objc class func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(_ version: String) -> Bool {
        return self.current.systemVersion.compare(version as String,
                                                  options: .numeric) != .orderedDescending
    }
    
}
