import UIKit

extension UIColor {
    
    static func hex(_ hex: UInt32, alpha: CGFloat = 1) -> UIColor {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex & 0x0000FF       ) / divisor

        return UIColor(red: red, green: green, blue: blue, alpha: fmax(0, fmin(alpha, 1)))
    }
    
}
