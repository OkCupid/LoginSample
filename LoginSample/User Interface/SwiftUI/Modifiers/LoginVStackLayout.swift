import SwiftUI

@available(iOS 13.0.0, *)
struct LoginVStackLayout: ViewModifier {
    
    let alignment: Alignment
    let size: CGSize
    let viewModel: LoginStackModel
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: viewModel.edgeInsets.top,
                                leading: viewModel.edgeInsets.left,
                                bottom: viewModel.edgeInsets.bottom,
                                trailing: viewModel.edgeInsets.right))
            .frame(width: size.width, height: size.height, alignment: alignment)
    }
    
}
