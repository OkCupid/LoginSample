import UIKit

final class LoginCoordinator: NSObject, Coordinator {

    // MARK: - Properties

    private weak var window: UIWindow?

    var rootViewController: UINavigationController

    // MARK: - Lifecycle

    init(window: UIWindow) {
        self.window = window
        self.rootViewController = UINavigationController()
        super.init()
    }

    // MARK: - Functions

    func start() {
        let loginContainerViewController = makeLoginContainerViewController()
        rootViewController.viewControllers = [loginContainerViewController]
        window?.rootViewController = rootViewController
        window?.makeKeyAndVisible()
    }
    
    // MARK: Private
    
    private func makeLoginContainerViewController() -> LoginContainerViewController {
        return LoginContainerViewController(delegate: self)
    }
    
}

extension LoginCoordinator: LoginViewDelegate {
    
    func didLogin(_ login: UserLogin) {
        print("\(login.email) logged in.")
    }
    
}
