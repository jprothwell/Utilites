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
public let kScreenScale = UIScreen.main.scale
public let kScreenWidth = kScreenSize.width
public let kScreenHeight = kScreenSize.height


public func PixelToFloat(_ p:CGFloat) -> CGFloat{
    return p/kScreenScale
}


