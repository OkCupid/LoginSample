import UIKit
import SwiftUI

@available(iOS 13.0.0, *)
protocol UIFontWeightConvertible {
    func convert(weight: UIFont.Weight) -> Font.Weight?
}

@available(iOS 13.0.0, *)
extension UIFontWeightConvertible {
    
    func convert(weight: UIFont.Weight) -> Font.Weight? {
        switch weight {
        case .black: return .black
        case .bold: return .bold
        case .heavy: return .heavy
        case .light: return .light
        case .medium: return .medium
        case .regular: return .regular
        case .semibold: return .semibold
        case .thin: return .thin
        case .ultraLight: return .ultraLight
        default: return nil
        }
    }
    
}


