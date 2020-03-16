import SwiftUI

@available(iOS 13.0.0, *)
struct LoginText: View, UIFontWeightConvertible {
    
    let viewModel: LoginTextModel

    var body: some View {
        Text(viewModel.text)
            .font(.system(size: viewModel.font.pointSize,
                          weight: convert(weight: viewModel.font.weight) ?? .regular))
    }

}
