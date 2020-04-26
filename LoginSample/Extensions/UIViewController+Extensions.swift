import UIKit

// https://www.swiftbysundell.com/basics/child-view-controllers/

extension UIViewController {
    
    func add(_ child: UIViewController, frame: CGRect) {
        addChild(child)
        child.view.frame = frame
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }

    func remove() {
        guard parent != nil else { return }

        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
    
}
