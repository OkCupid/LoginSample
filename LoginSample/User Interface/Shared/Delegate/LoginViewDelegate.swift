import Foundation

protocol LoginViewDelegate: AnyObject {
    func didLogin(_ login: UserLogin)
}
