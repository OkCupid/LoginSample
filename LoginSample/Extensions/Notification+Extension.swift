import UIKit

// https://www.vadimbulavin.com/how-to-move-swiftui-view-when-keyboard-covers-text-field/

extension Notification {
    
    var keyboardHeight: CGFloat {
        return (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect)?.height ?? 0
    }
    
}
