//
//  OrderViewModel.swift
//  formthotics
//
//  Created by Vasiliy on 20.01.2023.
//

import Foundation

class OrderViewModel: ObservableObject {
    
    @Published var order: Order
    @Published var user = DataUser(id: "", name: "", phone: 1, address: "", compani: "")
    
    init(order: Order) {
        self.order = order
    }
    
    func getUserData() {
        
        DatabaseService.shared.getProfile(by: order.userID) { result in
            switch result {
            case .success(let user):
                self.user = user
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }
        
    }
}
