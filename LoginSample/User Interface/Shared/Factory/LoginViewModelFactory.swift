import UIKit

struct LoginViewModelFactory {
    
    // MARK: - Functions
    
    static func create() -> LoginViewModel {
        return LoginViewModel(backgroundColor: UIColor.hex(0xF0F2F6),
                              buttonModel: createButtonModel(),
                              contentStackModel: createContentStackModel(),
                              emailTextEntryModel: createEmailTextEntryModel(),
                              formStackModel: createFormStackModel(),
                              imageModel: createImageModel(),
                              passwordTextEntryModel: createPasswordTextEntryModel(),
                              titleModel: createTitleModel())
    }
    
    // MARK: Private
    
    private static func createButtonModel() -> LoginButtonModel {
        let font: FontModel = .init(pointSize: 16, weight: .semibold)
        
        return LoginButtonModel(backgroundColor: UIColor.hex(0x0000BF),
                                cornerRadius: 4,
                                disabledBackgroundColor: UIColor.hex(0xCCCCCC),
                                height: 44,
                                highlightedBackgroundColor: UIColor.hex(0x3344FF),
                                title: NSLocalizedString("LOGIN", comment: "Login Form - CTA Title Text"),
                                titleColor: UIColor.hex(0xFFFFFF),
                                titleFont: font)
    }
    
    private static func createContentStackModel() -> LoginStackModel {
        let topInset: CGFloat = DeviceInfo.safeAreaTopInset + 34
        
        return LoginStackModel(alignment: .leading,
                               axis: .vertical,
                               edgeInsets: UIEdgeInsets(top: topInset, left: 24, bottom: 24, right: 24),
                               spacing: 30)
    }
    
    private static func createEmailTextEntryModel() -> LoginTextEntryViewModel {
        let titleText: String = NSLocalizedString("Email", comment: "Login Form - Row Title Text")
        let placeholderText: String = NSLocalizedString("enter email", comment: "Login Form - TextField Placeholder Text")
        
        return createTextEntryViewModel(titleText: titleText, placeholderText: placeholderText)
    }
    
    private static func createFormStackModel() -> LoginStackModel {
        return LoginStackModel(alignment: .leading, axis: .vertical, edgeInsets: .zero, spacing: 12)
    }
    
    private static func createImageModel() -> LoginImageModel {
        return LoginImageModel(contentMode: .scaleAspectFit,
                               height: 30,
                               name: "okc-logo")
    }
    
    private static func createPasswordTextEntryModel() -> LoginTextEntryViewModel {
        let titleText: String = NSLocalizedString("Password", comment: "Login Form - Row Title Text")
        let placeholderText: String = NSLocalizedString("enter password", comment: "Login Form - TextField Placeholder Text")
        
        return createTextEntryViewModel(titleText: titleText, placeholderText: placeholderText, secureTextFieldTextEntry: true)
    }
    
    private static func createTitleModel() -> LoginTextModel {
        let font: FontModel = .init(pointSize: 26, weight: .bold)
        
        return LoginTextModel(font: font,
                              numberOfLines: 2,
                              text: NSLocalizedString("Enter email\nand password", comment: "Login Form - Title Text"),
                              textAlignment: .left,
                              textColor: .black)
    }
    
    private static func createTextEntryViewModel(titleText: String, placeholderText: String, secureTextFieldTextEntry: Bool = false) -> LoginTextEntryViewModel {
        let shadowViewModel: ShadowViewModel = .init(color: UIColor.black,
                                                     offset: CGSize(width: 1, height: 1),
                                                     opacity: 0.1,
                                                     radius: 1)
        
        let textFieldFont: FontModel = .init(pointSize: 16, weight: .regular)
        
        let textFieldModel: LoginTextEntryTextFieldModel = .init(backgroundColor: UIColor.hex(0xFFFFFF),
                                                                 borderColor: .clear,
                                                                 borderWidth: 0,
                                                                 cornerRadius: 4,
                                                                 font: textFieldFont,
                                                                 padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10),
                                                                 placeholderText: placeholderText,
                                                                 placeholderTextColor: UIColor.gray,
                                                                 isSecureTextEntry: secureTextFieldTextEntry,
                                                                 shadowModel: shadowViewModel,
                                                                 textColor: .black)
        
        let titleFont: FontModel = .init(pointSize: 14, weight: .medium)
        
        let titleModel: LoginTextModel = .init(font: titleFont,
                                               numberOfLines: 1,
                                               text: titleText,
                                               textAlignment: .left,
                                               textColor: .black)
        
        let stackModel: LoginStackModel = .init(alignment: .leading,
                                                axis: .vertical,
                                                edgeInsets: .zero,
                                                spacing: 8)
        
        return LoginTextEntryViewModel(textFieldModel: textFieldModel,
                                       titleModel: titleModel,
                                       spacing: 8,
                                       stackModel: stackModel)
    }

}
