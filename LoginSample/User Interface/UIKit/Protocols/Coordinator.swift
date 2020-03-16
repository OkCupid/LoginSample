import UIKit

protocol Coordinator {
    associatedtype T = UIViewController

    var rootViewController: T { get }

    func start()
}
