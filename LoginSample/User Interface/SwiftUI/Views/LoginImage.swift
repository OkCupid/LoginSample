import SwiftUI

@available(iOS 13.0.0, *)
struct LoginImage: View, UIViewContentModeConvertible {
    
    let viewModel: LoginImageModel
    
    var body: some View {
        Image(viewModel.name)
            .resizable()
            .aspectRatio(contentMode: convert(contentMode: viewModel.contentMode) ?? .fit)
            .frame(height: viewModel.height)
    }
    
}
