//
import Foundation

class LoginViewModel {
    
    static let shared = LoginViewModel()
    
    func login(email: String, password: String, completion: @escaping (Result<User, Error>) -> Void ) {
        AuthFirebaseManager.shared.login(email: email, password: password) { result in
            completion(result)
        }
        
    }
    
}
