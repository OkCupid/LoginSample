import Foundation

struct LoginValidator {
    
    // MARK: - Properties
    
    private let emailRegExPattern: String = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    private let passwordRegExPattern: String = "^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$" // Minimum 8 characters at least 1 Alphabet and 1 Number
    
    // MARK: - Functions
    
    func validate(email: String) -> Bool {
        return validate(text: email, regExPattern: emailRegExPattern)
    }
    
    func validate(password: String) -> Bool {
        return validate(text: password, regExPattern: passwordRegExPattern)
    }
    
    // MARK: Private
    
    private func validate(text: String, regExPattern: String) -> Bool {
        return NSPredicate(format:"SELF MATCHES %@", regExPattern).evaluate(with: text)
    }
    
}
