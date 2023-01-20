//
//  AuthService.swift
//  formthotics
//
//  Created by Vasiliy on 13.01.2023.
//

import Foundation
import FirebaseAuth

class AuthService {
    
    static let shared = AuthService()
    
    private init () { }
    // хранит ссылку на Firebase таблицу с юзерами
    private let auth = Auth.auth()
    
    // создаем опционального юзера
    var currentUser: User? {
        return auth.currentUser
    }
    
    func signUp (email: String,
                 password: String,
                 completion: @escaping (Result<User, Error>) -> ()){
        
        auth.createUser(withEmail: email,
                        password: password) { result, error in
                if let result = result {
                    
                    let dataUser = DataUser(id: result.user.uid,
                                            name: "",
                                            phone: 0,
                                            address: "",
                                            compani: "")
                    
                    DatabaseService.shared.setProfile(user: dataUser) { resultDB in
                        switch resultDB {
                        case .success(_):
                            completion(.success(result.user))
                        case .failure(let error):
                            completion(.failure(error))
                        }
                    }
                    
                    
                } else if let error = error {
                    completion(.failure(error))
                }
            }
    }
    
    func signIn(email: String,
                password: String,
                completion: @escaping (Result<User, Error>) -> ()) {
        
        auth.signIn(withEmail: email, password: password) { result, error in
            if let result = result {
                completion(.success(result.user))
            } else if let error = error {
                completion(.failure(error))
            }
        }
        
    }
    
    
}
