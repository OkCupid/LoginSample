import SwiftUI

@available(iOS 13.0.0, *)
struct LoginTextField: View, UIFontWeightConvertible {
    
    @Binding var value: String
    
    let textFieldTapped: () -> Void
    let viewModel: LoginTextEntryTextFieldModel
    let width: CGFloat
    
    private var textField: some View {
        if viewModel.isSecureTextEntry {
            return AnyView(SecureField(self.viewModel.placeholderText,
                                       text: $value).onTapGesture(perform: textFieldTapped))
        } else {
            return AnyView(TextField(self.viewModel.placeholderText,
                                     text: $value).onTapGesture(perform: textFieldTapped))
        }
    }
    
    var body: some View {
        textField
            .font(.system(size: viewModel.font.pointSize,
                          weight: convert(weight: viewModel.font.weight) ?? .regular))
            .padding(EdgeInsets(top: self.viewModel.padding.top,
                                leading: self.viewModel.padding.left,
                                bottom: self.viewModel.padding.bottom,
                                trailing: self.viewModel.padding.right))

            .background(Color(self.viewModel.backgroundColor))
            .cornerRadius(self.viewModel.cornerRadius)
            .shadow(color: Color(self.viewModel.shadowModel.color.withAlphaComponent(self.viewModel.shadowModel.opacity)),
                    radius: self.viewModel.shadowModel.radius,
                    x: self.viewModel.shadowModel.offset.width,
                    y: self.viewModel.shadowModel.offset.height)
            .frame(width: width)
    }

}
