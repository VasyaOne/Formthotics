//
//  ProductDitailViewModel.swift
//  formthotics
//
//  Created by Vasiliy on 12.01.2023.
//

import Foundation

class ProductDitailViewModel: ObservableObject {
    
    @Published var product: Product
    @Published var sizes = ["XS","S","M","L","XL","XXL"]
    @Published var count = 0
    
    init(product:Product){
        self.product = product
    }
    
}
