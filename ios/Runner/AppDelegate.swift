import UIKit
import Flutter
import Firebase
//import KakaoOpenSDK

@UIApplicationMain
 @objc class AppDelegate: FlutterAppDelegate {
    
    override init() { FirebaseApp.configure() }

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}

//func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {
//   if KOSession.handleOpen(url) {
//      return true
//   }
//      return false
//}
//internal func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any]) -> Bool {
//   if KOSession.handleOpen(url) {
//      return true
//   }
//      return false
//}
//
