import SwiftUI

@available(iOS 13.0.0, *)
struct LoginVStack<Content: View>: View, UIStackViewAlignmentConvertible {
    
    private let viewModel: LoginStackModel
    private let content: () -> Content
    
    var body: some View {
        VStack(alignment: convert(alignment: viewModel.alignment) ?? .leading, spacing: viewModel.spacing) {
            content()
        }
    }
    
    init(viewModel: LoginStackModel, @ViewBuilder content: @escaping () -> Content) {
        self.viewModel = viewModel
        self.content = content
    }
    
}
