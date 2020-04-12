import SwiftUI

@available(iOS 13.0.0, *)
struct LoginText: View {
    
    let viewModel: LoginTextModel
    
    var body: some View {
        Text(viewModel.text)
            .font(Font(viewModel.font as CTFont))
            .lineLimit(viewModel.numberOfLines)
            .foregroundColor(Color(viewModel.textColor))
    }

}
