import SwiftUI

@available(iOS 13.0.0, *)
struct LoginTextField: View, UITextAutocorrectionTypeConvertible {
    
    @Binding var value: String
    
    let textFieldTapped: () -> Void
    let viewModel: LoginTextEntryTextFieldModel
    let width: CGFloat
    
    private var textField: some View {
        if viewModel.isSecureTextEntry {
            return AnyView(SecureField(viewModel.placeholderText, text: $value))
        } else {
            return AnyView(TextField(viewModel.placeholderText, text: $value))
        }
    }
    
    var body: some View {
        textField
            .autocapitalization(viewModel.autocapitalizationType)
            .disableAutocorrection(!(convert(autocorrectionType: viewModel.autocorrectionType) ?? false))
            .font(Font(viewModel.font as CTFont))
            .padding(EdgeInsets(top: viewModel.padding.top,
                                leading: viewModel.padding.left,
                                bottom: viewModel.padding.bottom,
                                trailing: viewModel.padding.right))

            .background(Color(viewModel.backgroundColor))
            .cornerRadius(viewModel.cornerRadius)
            .shadow(color: Color(viewModel.shadowModel.color.withAlphaComponent(viewModel.shadowModel.opacity)),
                    radius: viewModel.shadowModel.radius,
                    x: viewModel.shadowModel.offset.width,
                    y: viewModel.shadowModel.offset.height)
            .frame(width: width)
            .onTapGesture(perform: textFieldTapped)
    }
    
}
