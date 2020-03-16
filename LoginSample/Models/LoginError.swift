import Foundation

enum LoginError: Error {
    case invalidEmailOrPassword
}

extension LoginError: LocalizedError {
    
    var errorDescription: String? {
        switch self {
        case .invalidEmailOrPassword:
            return "Incorrect email or password"
        }
    }
    
}
