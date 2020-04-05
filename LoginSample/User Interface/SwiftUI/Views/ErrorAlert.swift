import SwiftUI

@available(iOS 13.0.0, *)
struct ErrorAlert: UIViewRepresentable {
    
    let message: String
    let width: CGFloat
    
    func makeUIView(context: Context) -> ErrorAlertView {
        return ErrorAlertView(message: message, width: width)
    }

    func updateUIView(_ uiView: ErrorAlertView, context: Context) {
        // not in use
    }
    
}
