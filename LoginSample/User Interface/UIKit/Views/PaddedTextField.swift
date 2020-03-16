import UIKit

final class PaddedTextField: UITextField {
    
    // MARK: - Properties
    
    var padding: UIEdgeInsets = .zero
    
    // MARK: - Functions
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
}
