import UIKit
import SwiftUI

@available(iOS 13.0.0, *)
protocol UIStackViewAlignmentConvertible {
    func convert(alignment: UIStackView.Alignment) -> HorizontalAlignment?
    func convert(alignment: UIStackView.Alignment) -> VerticalAlignment?
}

@available(iOS 13.0.0, *)
extension UIStackViewAlignmentConvertible {
    
    func convert(alignment: UIStackView.Alignment) -> HorizontalAlignment? {
        switch alignment {
        case .center: return .center
        case .leading: return .leading
        case .trailing: return .trailing
        default: return nil
        }
    }
    
    func convert(alignment: UIStackView.Alignment) -> VerticalAlignment? {
        switch alignment {
        case .bottom: return .bottom
        case .center: return .center
        case .firstBaseline: return .firstTextBaseline
        case .lastBaseline: return .lastTextBaseline
        case .top: return .top
        default: return nil
        }
    }
    
}
