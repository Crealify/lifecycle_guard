import Flutter
import UIKit

public class LifecycleGuardPlugin: NSObject, FlutterPlugin {
  private var backgroundTask: UIBackgroundTaskIdentifier = .invalid

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "lifecycle_guard", binaryMessenger: registrar.messenger())
    let instance = LifecycleGuardPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "startBackgroundSync":
      // Request a background execution window from iOS
      // This gives the app extra time (30s to 3 mins) after it is suspended or swiped.
      self.backgroundTask = UIApplication.shared.beginBackgroundTask(withName: "LifecycleGuardTask") {
        // Expiration handler: Called when iOS is about to kill the task
        UIApplication.shared.endBackgroundTask(self.backgroundTask)
        self.backgroundTask = .invalid
      }
      result(nil)
      
    case "stopSecureTask":
      // Explicitly end the background task when work is finished
      if self.backgroundTask != .invalid {
        UIApplication.shared.endBackgroundTask(self.backgroundTask)
        self.backgroundTask = .invalid
      }
      result(nil)
      
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
