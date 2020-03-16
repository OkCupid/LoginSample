import UIKit
import SwiftUI

@available(iOS 13.0.0, *)
protocol UIViewContentModeConvertible {
    func convert(contentMode: UIView.ContentMode) -> ContentMode?
}

@available(iOS 13.0.0, *)
extension UIViewContentModeConvertible {
    
    func convert(contentMode: UIView.ContentMode) -> ContentMode? {
        switch contentMode {
        case .scaleAspectFill: return .fill
        case .scaleAspectFit: return .fit
        default: return nil
        }
    }
    
}
