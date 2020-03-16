import SwiftUI

@available(iOS 13.0.0, *)
struct ErrorAlert: UIViewRepresentable {
    
    @Binding var message: String
    let width: CGFloat
    
    func makeUIView(context: Context) -> ErrorAlertView {
        return ErrorAlertView(message: message, width: width)
    }

    func updateUIView(_ uiView: ErrorAlertView, context: Context) {
        uiView.message = message
    }
    
    static func getHeight(text: String, width: CGFloat) -> CGFloat {
        ErrorAlertView.getHeight(text: text, width: width)
    }
    
}
