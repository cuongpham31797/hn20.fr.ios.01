import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("App DidFinishLaunchingWithOptions")
        NSSetUncaughtExceptionHandler { exception in
            print("Error Handling: ", exception)
            print("Error Handling callStackSymbols: ", exception.callStackSymbols)
        }
        return true
    }
    
    func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("App WillFinishLaunchingWithOptions")
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print("App DidBecomeActive")
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print("App WillResignActive")
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print("App WillTerminate")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print("App DidEnterBackground")
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        print("App WillEnterForeground")
    }
    

}

