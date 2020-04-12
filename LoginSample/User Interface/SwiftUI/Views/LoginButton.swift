import SwiftUI

@available(iOS 13.0.0, *)
struct LoginButton: View {
    
    let action: () -> Void
    let isDisabled: Bool
    let viewModel: LoginButtonModel
    let width: CGFloat
    
    var body: some View {
        Button(action: action) {
            Text(self.viewModel.title)
                .font(Font(viewModel.titleFont as CTFont))
        }
        .buttonStyle(LoginButtonStyle(isDisabled: isDisabled, viewModel: viewModel, width: width))
        .disabled(isDisabled)
    }

}
