//
//  DatabaseService.swift
//  formthotics
//
//  Created by Vasiliy on 13.01.2023.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    
    static let shared = DatabaseService()
    
    private let db = Firestore.firestore()  // обращение к базе данных в Firebase
    
    private var usersRef: CollectionReference {
        return db.collection("users")
    }
    
    private init() { }
    
    func setUser(user: DataUser, completion: @escaping (Result<DataUser, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
}
