import UIKit

struct DeviceInfo {
    
    static var safeAreaTopInset: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.top ?? 0
        } else {
            return UIApplication.shared.statusBarFrame.height
        }
    }
    
}
