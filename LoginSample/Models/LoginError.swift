import Foundation

enum LoginError: Error {
    case invalidEmail
    case invalidEmailAndPassword
    case invalidPassword
}

extension LoginError: LocalizedError {
    
    var errorDescription: String? {
        let invalidEmailDescription: String = NSLocalizedString("Email entered is not a valid format.", comment: "Login Error - Invalid Email Message")
        let invalidPasswordDescription: String = NSLocalizedString("Password must be at least 8 characters and contain only letters and numbers.", comment: "Login Error - Invalid Password Message")
        
        switch self {
        case .invalidEmail:
            return invalidEmailDescription
        case .invalidEmailAndPassword:
            return "\(invalidEmailDescription)\n\n\(invalidPasswordDescription)"
        case .invalidPassword:
            return invalidPasswordDescription
        }
    }
    
}
