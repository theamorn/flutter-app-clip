import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    let shareUserDefault = UserDefaults(suiteName: "group.com.amorn")

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        initFlutterChannel()
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
    
    private func initFlutterChannel() {
        if let controller = window?.rootViewController as? FlutterViewController {
            let channel = FlutterMethodChannel(
                name: "com.amorn.appclip",
                binaryMessenger: controller.binaryMessenger)
            
            channel.setMethodCallHandler({ [weak self] (
                call: FlutterMethodCall,
                result: @escaping FlutterResult) -> Void in
                switch call.method {
                case "getDataFromAppDelegate":
                    guard let id = self?.shareUserDefault?.string(forKey: "id") else {
                        result(FlutterMethodNotImplemented)
                        return
                    }
                    result(id)
                default:
                    result(FlutterMethodNotImplemented)
                }
            })
        }
    }
    
    private func sendData(data message: [String: String]) {
        if let method = message["method"], let controller = self.window?.rootViewController as? FlutterViewController {
            let channel = FlutterMethodChannel(
                name: "com.theamorn.appclip",
                binaryMessenger: controller.binaryMessenger)
            channel.invokeMethod(method, arguments: message)
        }
    }
    
}
