//
//  OrderStatus.swift
//  formthotics
//
//  Created by Vasiliy on 18.01.2023.
//

import Foundation

enum OrderStatus: String {
    
    case new = "Новый"
    case cooking = "Готовится"
    case delivery = "Доставляется"
    case completed = "Выполнен"
    case cancelled = "Отменен"
    
}
