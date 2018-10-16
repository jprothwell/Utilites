import Foundation
import UIKit

public let kStatusBarHeight = Float(UIApplication.shared.statusBarFrame.size.height)

public let kApplication = UIApplication.shared
public let kAppKeyWindow = kApplication.keyWindow
public let kAppDelegate = kApplication.delegate
public let kAppNotificationCenter = NotificationCenter.default
public let kAppRootViewController = kAppDelegate?.window??.rootViewController

public let kAppleLanguage = (UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String) ?? ""
public let kAppVersion = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""

public let kScreenSize = UIScreen.main.bounds.size
public let kScreenScale = Float(UIScreen.main.scale)
public let kScreenWidth = Float(kScreenSize.width)
public let kScreenHeight = Float(kScreenSize.height)


public func PixelToFloat(_ p:Float) -> Float{
    return p/kScreenScale
}


