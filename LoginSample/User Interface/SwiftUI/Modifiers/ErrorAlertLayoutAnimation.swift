import SwiftUI

@available(iOS 13.0.0, *)
struct ErrorAlertLayoutAnimation: ViewModifier {
    
    let message: String
    let width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: width, height: ErrorAlertView.getHeight(text: message, width: width))
            .transition(.moveTopEdgeInOutWithOpacity)
    }
    
}
