//
//  ProductCell.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//

import SwiftUI

struct ProductCell: View {
    
    var product : Product
    
    var body: some View {
        
        VStack (alignment: .leading){
            HStack {
                
                Image(product.imageUrl)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: screen.width * 0.30, height: screen.width * 0.20)
                    .shadow(radius: 12)
                    .padding()
                
                VStack (alignment: .leading) {
                    Text(product.title)
                        .font(.custom("AvenirNext-bould", size: 14))
                    Text("Жесткость: \(product.rigidity)")
                        .font(.custom("AvenirNext-regular", size: 12))
                    
                    Text("Вес до: \(product.weight)")
                        .font(.custom("AvenirNext-regular", size: 12))
                    
                    Text("\(product.price)руб")
                }
                Spacer()

            }
            .frame(width: screen.width * 1, height: screen.width * 0.24)
//        .background(Color("ColorAlpha"))
        }
        
    }
}

struct ProductCell_Previews: PreviewProvider {
    static var previews: some View {
        ProductCell(product: Product(id: "1",
                                     title: "КРАСНО-ГОЛУБЫЕ",
                                     imageUrl: "12",
                                     price: 3500,
                                     discript: "Стельки на каждый день",
                                     layers: 2,
                                     rigidity: 6,
                                     age: "Взрослый",
                                     weight: 70))
    }
}

