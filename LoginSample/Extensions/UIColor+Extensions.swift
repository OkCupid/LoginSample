import UIKit


extension UIColor {
    
    static var primaryBackgroundColor: UIColor {
        UIColor.hex(0xF0F2F6)
    }
    
    static var secondaryBackgroundColor: UIColor {
        .white
    }
    
    static var primaryButtonBackgroundColor: UIColor {
        UIColor.hex(0x0000BF)
    }
    
    static var secondaryButtonBackgroundColor: UIColor {
        UIColor.hex(0x3344FF)
    }
    
    static var tertiaryButtonBackgroundColor: UIColor {
        UIColor.hex(0xCCCCCC)
    }
    
    static var primaryButtonTextColor: UIColor {
        .white
    }
    
    static var primaryShadowColor: UIColor {
        .black
    }
    
    static var primaryTextColor: UIColor {
        .black
    }
    
    static var secondaryTextColor: UIColor {
        .gray
    }
    
    static var primaryErrorBackgroundColor: UIColor {
        .red
    }
    
    static var primaryErrorTextColor: UIColor {
        .white
    }
    
}

extension UIColor {
    
    static func hex(_ hex: UInt32, alpha: CGFloat = 1) -> UIColor {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex & 0x0000FF       ) / divisor

        return UIColor(red: red, green: green, blue: blue, alpha: fmax(0, fmin(alpha, 1)))
    }
    
}
