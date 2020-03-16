import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {
    
    lazy var window: UIWindow? = .init()
    private var loginCoordinator: LoginCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        guard let window = window else { return false }
        
        loginCoordinator = LoginCoordinator(window: window)
        loginCoordinator?.start()
        
        return true
    }

}

