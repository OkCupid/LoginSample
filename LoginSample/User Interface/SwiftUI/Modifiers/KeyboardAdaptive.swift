import Combine
import SwiftUI

@available(iOS 13.0.0, *)
struct KeyboardAdaptive: ViewModifier {
    
    @State private var yOffset: CGFloat = 0
    
    func body(content: Content) -> some View {
        GeometryReader { geometry in
            content
                .offset(x: 0, y: -self.yOffset)
                .onReceive(Publishers.keyboardHeight) { keyboardHeight in
                    let keyboardTop = geometry.frame(in: .global).height - keyboardHeight
                    let focusedTextInputBottom = UIResponder.currentFirstResponder?.globalFrame?.maxY ?? 0
                    self.yOffset = max(0, focusedTextInputBottom - keyboardTop - geometry.safeAreaInsets.bottom)
                }
                .animation(.easeOut(duration: 0.16))
        }
    }
}
