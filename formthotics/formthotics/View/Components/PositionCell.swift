//
//  PositionCell.swift
//  formthotics
//
//  Created by Vasiliy on 12.01.2023.
//

import SwiftUI

struct PositionCell: View {
    
    let position: Position
    
    var body: some View {
        HStack {
            VStack (alignment: .leading){
                Text(position.product.title)
                HStack {
                    Text("Размер: M") //MARK: поправить размер
                    Text("Кол-во: \(position.count) шт")
                    Text("\(position.cost) руб")
                        .frame(width: 100, alignment: .trailing)
                        .fontWeight(.bold)
                }
            }
        }.padding(.horizontal)
    }
}

struct PositionCell_Previews: PreviewProvider {
    static var previews: some View {
        PositionCell(position: Position(id: UUID().uuidString,
                                        product:
                                            Product(
                                                id: UUID().uuidString,
                                                title: "ГОЛУБЫЕ",
                                                imageUrl: "12",
                                                price: 3500,
                                                discript: "Однослойный ортез",
                                                layers: 2,
                                                rigidity: 2,
                                                age: "Взрослые",
                                                weight: 50),
                                        count: 3))
       
    }
}
