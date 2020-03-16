import Foundation

final class LoginDataManager {
    
    // MARK: - Properties
    
    private let validator: LoginValidator
    
    // MARK: - Lifecycle
    
    init(validator: LoginValidator = .init()) {
        self.validator = validator
    }
    
    // MARK: - Functions
    
    func createLogin(email: String, password: String, completion: @escaping (Result<UserLogin, Error>) -> Void) {
        if isValidLogin(email: email, password: password) {
            let login = UserLogin(email: email, password: password)
            completion(.success(login))
        } else {
            completion(.failure(LoginError.invalidEmailOrPassword))
        }
    }
    
    // MARK: Private
    
    private func isValidLogin(email: String, password: String) -> Bool {
        let isValidEmail = validator.validate(email: email)
        let isValidPassword = validator.validate(password: password)
        
        return isValidEmail && isValidPassword
    }
    
}
