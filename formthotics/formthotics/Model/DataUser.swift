//
//  DataUser.swift
//  formthotics
//
//  Created by Vasiliy on 13.01.2023.
//

import Foundation
import FirebaseFirestore

struct DataUser: Identifiable {
    
    var id: String 
    var name: String
    var phone: Int
    var address: String
    var compani: String
    
    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = self.id
        repres["name"] = self.name
        repres["phone"] = self.phone
        repres["address"] = self.address
        repres["compani"] = self.compani
        
        return repres
    }

}
