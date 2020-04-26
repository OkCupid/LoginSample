import UIKit
import Combine

// https://www.vadimbulavin.com/how-to-move-swiftui-view-when-keyboard-covers-text-field/

@available(iOS 13.0, *)
extension Publishers {
    
    static var keyboardHeight: AnyPublisher<CGFloat, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIApplication.keyboardWillShowNotification)
            .map { $0.keyboardHeight }
        
        let willHide = NotificationCenter.default.publisher(for: UIApplication.keyboardWillHideNotification)
            .map { _ in CGFloat(0) }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
    
}
