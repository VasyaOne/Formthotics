//
//  MainTabBarViewModel.swift
//  formthotics
//
//  Created by Vasiliy on 13.01.2023.
//

import Foundation
import FirebaseAuth

class MainTabBarViewModel: ObservableObject {
    
    @Published var user: User
    
    init (user: User){
        self.user = user
    }
    
}
