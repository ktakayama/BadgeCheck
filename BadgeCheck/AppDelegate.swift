
import UIKit
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {

        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [ .badge, ]) { (granted, error) in
        }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        reserveNotification()
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }

    func reserveNotification1() {
//        let application = UIApplication.shared
//        application.cancelAllLocalNotifications()
//
//        let today = Date()
//
//        let mx = 3
//        (0 ..< mx + 1).forEach { i in
//            let notification = UILocalNotification()
//            notification.fireDate = today.addingTimeInterval(TimeInterval(Double(i) + 1))
//            notification.applicationIconBadgeNumber = mx - i - 1
//            print(notification.applicationIconBadgeNumber)
//            application.scheduleLocalNotification(notification)
//        }
    }

    func reserveNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()

        let mx = 3
        (0 ..< mx + 1).forEach { i in
            let content = UNMutableNotificationContent()
            content.badge = (mx - i - 1) as NSNumber;

            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: (Double(i)+1), repeats: false)

            let type = "alerm\(i)"
            let request = UNNotificationRequest(identifier: type, content: content, trigger: trigger)
            center.add(request, withCompletionHandler: nil)
        }
    }

}

