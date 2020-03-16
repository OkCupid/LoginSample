import SwiftUI
import Combine

@available(iOS 13.0.0, *)
struct LoginTextEntry: View {

    @ObservedObject var userEntry: UserLoginEntry
    
    let textFieldTapped: () -> Void
    
    let viewModel: LoginTextEntryViewModel
    let width: CGFloat
    
    var body: some View {
        LoginVStack(viewModel: self.viewModel.stackModel) {
            LoginText(viewModel: self.viewModel.titleModel)
            LoginTextField(value: self.$userEntry.value,
                           textFieldTapped: self.textFieldTapped,
                           viewModel: self.viewModel.textFieldModel,
                           width: self.width)
        }
    }

}
