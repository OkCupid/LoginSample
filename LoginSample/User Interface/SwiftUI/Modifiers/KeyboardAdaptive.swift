import Combine
import SwiftUI

// https://www.vadimbulavin.com/how-to-move-swiftui-view-when-keyboard-covers-text-field/

@available(iOS 13.0.0, *)
struct KeyboardAdaptive: ViewModifier {
    
    @State private var yOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .offset(x: 0, y: -self.yOffset)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    let keyboardMinY = geometry.frame(in: .global).height - keyboardHeight
                    let firstResponderViewMaxY = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    let firstResponderBottomPadding: CGFloat = 20
                    self.yOffset = max(0, (firstResponderViewMaxY + firstResponderBottomPadding) - keyboardMinY - geometry.safeAreaInsets.bottom)
                }
                .animation(.easeOut(duration: 0.16))
        }
    }
}
