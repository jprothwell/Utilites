import Foundation
import UIKit

let kUIStatusBarHeight = Float(UIApplication.shared.statusBarFrame.size.height)

let kApplication = UIApplication.shared
let kAppKeyWindow = kApplication.keyWindow
let kAppDelegate = kApplication.delegate
let kAppNotificationCenter = NotificationCenter.default
let kAppRootViewController = kAppDelegate?.window??.rootViewController

let kAppleLanguage = (UserDefaults.standard.array(forKey: "AppleLanguages")?.first as? String) ?? ""
let kAppVersion = (Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String) ?? ""
