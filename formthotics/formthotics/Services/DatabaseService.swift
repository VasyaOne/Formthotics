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
    
    private var ordersRef: CollectionReference {
        return db.collection("orders")
    }
    
    private init() { }
    
    // 2 методa для получение заказа
    
    func getPositions (by orderID: String,
                       completion: @escaping (Result<[Position], Error>) -> ()) {
        
        let positionsRef = ordersRef.document(orderID).collection("positions")
        
        positionsRef.getDocuments { qSnapshot, error in
            if let querySnapshot = qSnapshot{
                var positions = [Position]()
                
                for doc in querySnapshot.documents {
                    if let position = Position(doc: doc) {
                        positions.append(position)
                    }
                }
                completion(.success(positions))
            } else if let error = error {
                completion(.failure(error))
            }
        }
    }
    
    func getOrders(by userID: String?,
                   completion: @escaping (Result<[Order], Error>) -> ()) {
       
        self.ordersRef.getDocuments { qSnapshot, error in
            if let qSnapshot = qSnapshot {
                var orders = [Order]()
                for doc in qSnapshot.documents {
                    if let userID = userID {
                        if let order = Order(doc: doc), order.userID == userID {
                            orders.append(order)
                        }
                    } else { // ветка админа
                        if let order = Order(doc: doc){
                            orders.append(order)
                        }
                    }
                }
                completion(.success(orders))
            } else if let error = error{
                completion(.failure(error))
            }
        }
    }
    
        // Метод для отправки заказа
    
    func setOrder (order: Order,
                   completion: @escaping (Result<Order, Error>) -> ()) {
        ordersRef.document(order.id).setData(order.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                self.setPositions(to: order.id,
                             positions: order.positions) { result in
                    switch result {
                    case .success(let positions):
                        print(positions.count)
                        completion(.success(order))
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    
    func setPositions(to orderID: String,
                     positions: [Position],
                     completion: @escaping (Result<[Position], Error>) -> ()) {
        let positionsRef = ordersRef.document(orderID).collection("position")
        for position in positions {
            positionsRef.document(position.id).setData(position.representation)
        }
        completion(.success(positions))
    }
    
    
    func setProfile(user: DataUser,
                    completion: @escaping (Result<DataUser, Error>) -> ()) {
        usersRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
    
    
    func getProfile(by userID: String? = nil, completion: @escaping (Result<DataUser, Error>) -> ()) {
        
        usersRef.document(userID != nil ? userID! : AuthService.shared.currentUser!.uid).getDocument { dokSnapshot, error in
            guard let snap = dokSnapshot else { return }
            guard let data = snap.data() else { return }
            guard let userName = data["name"] as? String else { return }
            guard let id = data["id"] as? String else { return }
            guard let phone = data["phone"] as? Int else { return }
            guard let compani = data["compani"] as? String else { return }
            guard let address = data["address"] as? String else { return }
            
            let user = DataUser(id: id,
                                name: userName,
                                phone: phone,
                                address: address,
                                compani: compani)
            
            completion(.success(user))
        }
        
    }
}
