import SwiftUI

@available(iOS 13.0.0, *)
struct LoginView: View {
    
    // MARK: - Properties
    
    private let viewModel: LoginViewModel
    private let dataManager: LoginDataManager
    private weak var delegate: LoginViewDelegate?
    
    @ObservedObject private var emailEntry: UserLoginEntry = .init()
    @ObservedObject private var passwordEntry: UserLoginEntry = .init()
    
    @State private var showError: Bool = false
    @State private var errorMessage: String = ""
    
    private var isButtonDisabled: Bool {
        emailEntry.value.isEmpty || passwordEntry.value.isEmpty
    }
    
    @State private var showDetail = false
    
    var body: some View {
        GeometryReader { geometryProxy in 
            ZStack(alignment: .top) {
                Color(self.viewModel.backgroundColor).zIndex(0)
                    .onTapGesture {
                        self.endEditing()
                    }
                
                LoginVStack(viewModel: self.viewModel.contentStackModel) {
                    LoginImage(viewModel: self.viewModel.imageModel)
                    LoginText(viewModel: self.viewModel.titleModel)

                    LoginVStack(viewModel: self.viewModel.formStackModel) {
                        LoginTextEntry(userEntry: self.emailEntry,
                                       textFieldTapped: self.textEntryTextFieldTapped,
                                       viewModel: self.viewModel.emailTextEntryModel,
                                       width: self.getContentWidth(proxy: geometryProxy))
                        LoginTextEntry(userEntry: self.passwordEntry,
                                       textFieldTapped: self.textEntryTextFieldTapped,
                                       viewModel: self.viewModel.passwordTextEntryModel,
                                       width: self.getContentWidth(proxy: geometryProxy))
                    }
                    
                    LoginButton(action: self.buttonTapped,
                                isDisabled: self.isButtonDisabled,
                                viewModel: self.viewModel.buttonModel,
                                width: self.getContentWidth(proxy: geometryProxy))
                        
                }
                .modifier(LoginVStackLayout(alignment: .topLeading,
                                            size: geometryProxy.size,
                                            viewModel: self.viewModel.contentStackModel))
                .modifier(KeyboardAdaptive())
                .zIndex(1)
                
                if self.showError {
                    ErrorAlert(message: self.errorMessage, width: geometryProxy.size.width)
                        .modifier(ErrorAlertLayoutAnimation(message: self.errorMessage,
                                                            width: geometryProxy.size.width))
                        .zIndex(2)

                }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
    
    // MARK: - Lifecycle
    
    init(viewModel: LoginViewModel = LoginViewModelFactory.create(),
         dataManager: LoginDataManager = .init(),
         delegate: LoginViewDelegate?) {
        
        self.viewModel = viewModel
        self.dataManager = dataManager
        self.delegate = delegate
    }
    
    // MARK: - Functions
    
    private func textEntryTextFieldTapped() {
        guard showError else { return }
        
        withAnimation {
            self.showError = false
        }
        
        errorMessage = ""
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    private func buttonTapped() {
        guard !showError else { return }
        
        dataManager.createLogin(email: emailEntry.value,
                                password: passwordEntry.value,
                                completion: { (result) in
            switch result {
            case .success(let login):
                self.delegate?.didLogin(login)
            case .failure(let error):
                self.errorMessage = error.localizedDescription
                withAnimation {
                    self.showError = true
                }
            }
        })
    }
    
    private func getContentWidth(proxy: GeometryProxy) -> CGFloat {
        let horizontalInsets: CGFloat = (
            viewModel.contentStackModel.edgeInsets.left +
            viewModel.contentStackModel.edgeInsets.right
        )
        
        return proxy.size.width - horizontalInsets
    }

}

@available(iOS 13.0.0, *)
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(delegate: nil)
    }
}
