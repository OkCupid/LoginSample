import SwiftUI

@available(iOS 13.0.0, *)
struct LoginButton: View, UIFontWeightConvertible {
    
    let action: () -> Void
    let isDisabled: Bool
    let viewModel: LoginButtonModel
    let width: CGFloat
    
    var body: some View {
        Button(action: action) {
            Text(self.viewModel.title)
                .font(.system(size: self.viewModel.titleFont.pointSize,
                              weight: convert(weight: self.viewModel.titleFont.weight) ?? .semibold))
        }
        .buttonStyle(LoginButtonStyle(isDisabled: isDisabled, viewModel: viewModel, width: width))
    }

}
