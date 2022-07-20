//
import Foundation

class SignUpViewModel {
    let firebaseManager = FirebaseManager.shared
    static let shared = SignUpViewModel()
    
    func addUser(name: String, age: Int, email: String, password: String, completion: @escaping (Result<User, Error>) -> Void ) {
        let userID = firebaseManager.getDocID(forCollection: .users)
        let user = User(id: userID, name: name, age: age, email: email, password: password)
        
        firebaseManager.addDocument(document: user, collection: .users) { result in
            completion(result)
        }
    }
    
}
