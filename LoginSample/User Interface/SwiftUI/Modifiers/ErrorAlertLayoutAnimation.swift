import SwiftUI

@available(iOS 13.0.0, *)
struct ErrorAlertLayoutAnimation: ViewModifier {
    
    @Binding var message: String
    @Binding var showError: Bool
    
    let width: CGFloat
    
    func body(content: Content) -> some View {
        content
            .frame(width: width,
                   height: ErrorAlert.getHeight(text: message, width: width))
            .offset(y: showError ? 0 : -ErrorAlert.getHeight(text: message, width: width))
            .animation(.easeIn(duration: 0.2))
    }
    
}
