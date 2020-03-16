import SwiftUI

@available(iOS 13.0.0, *)
struct LoginButtonStyle: ButtonStyle {

    // MARK: - Properties
    
    let isDisabled: Bool
    let viewModel: LoginButtonModel
    let width: CGFloat
    
    // MARK: - Functions
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(self.viewModel.titleColor))
            .frame(width: width, height: self.viewModel.height)
            .background(Color(getBackgroundColor(configuration: configuration)))
            .cornerRadius(self.viewModel.cornerRadius)
            .disabled(isDisabled)
    }
    
    // MARK: Private
    
    private func getBackgroundColor(configuration: Self.Configuration) -> UIColor {
        if isDisabled {
            return viewModel.disabledBackgroundColor
        } else if configuration.isPressed {
            return viewModel.highlightedBackgroundColor
        } else {
            return viewModel.backgroundColor
        }
    }

}
