//
//  ProfileViewModel.swift
//  formthotics
//
//  Created by Vasiliy on 18.01.2023.
//

import Foundation
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    
    @Published var profile: DataUser
    @Published var orders: [Order] = [Order]()
    
    init(profile: DataUser) {
        self.profile = profile
    }
    
    func getOrders () {
        DatabaseService.shared.getOrders(by: AuthService.shared.currentUser?.accessibilityHint) { result in
            switch result {
            case .success(let orders):
                self.orders = orders
                
                for (index, order) in self.orders.enumerated() {
                    DatabaseService.shared.getPositions(by: order.id) { result in
                        switch result {
                        case .success(let positions):
                            self.orders[index].positions = positions
                            print(self.orders[index].cost)
                        case .failure(let error):
                            print(error.localizedDescription)
                        }
                    }
                }
                print("Всего заказов \(orders.count)")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    func setProfile() {
        
        DatabaseService.shared.setProfile(user: self.profile) { result in
            switch result {
            case .success(let user):
                print(user.name)
            case .failure(_):
                print("Ошибка отправки данных")
            }
        }
        
    }
    
    func getProfile() {
        DatabaseService.shared.getProfile { result in
            switch result {
            case .success(let user):
                self.profile = user
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}
