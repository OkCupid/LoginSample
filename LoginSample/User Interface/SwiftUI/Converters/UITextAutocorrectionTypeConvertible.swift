import UIKit
import SwiftUI

@available(iOS 13.0.0, *)
protocol UITextAutocorrectionTypeConvertible {
    func convert(autocorrectionType: UITextAutocorrectionType) -> Bool?
}

@available(iOS 13.0.0, *)
extension UITextAutocorrectionTypeConvertible {
    
    func convert(autocorrectionType: UITextAutocorrectionType) -> Bool? {
        switch autocorrectionType {
        case .no:
            return false
        case .yes:
            return true
        default:
            return nil
        }
    }
    
}
