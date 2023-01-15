//
//  CartView.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//

import SwiftUI

struct CartView: View {
    
    @StateObject var viewModel: CartViewModel
    
    var body: some View {
       
        VStack {
            
            List(viewModel.position) { position in
                PositionCell(position: position)
                    .swipeActions {
                        Button {
                            viewModel.position.removeAll { pos in
                                pos.id == position.id
                            }
                        } label: {
                            Text("Удалить")
                        }.tint(.red)
                    }
            }
            .listStyle(.plain)
            .padding(.top,20)
            
            HStack {
                Text("ИТОГО:")
                    .fontWeight(.bold)
                Text("\(self.viewModel.cost) руб")
                    .fontWeight(.bold)
            }
            .padding()
            
            HStack {
                Button {
                    print("Отменить")
                } label: {
                    Text("Отменить")
                        .padding()
                        .frame(maxWidth: 140)
                        .foregroundColor(.blue)
                        .background(Color("ColorAlpha"))
                        .cornerRadius(10)
                }
                
                Button {
                    print("Заказать")
                } label: {
                    Text("Заказать")
                        .padding()
                        .frame(maxWidth: 170)
                        .foregroundColor(.white)
                        .background(LinearGradient(colors: [Color("ColorLightBlue"), Color("ColorBlue")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(10)
                }
            }.padding(.bottom,30)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(viewModel: CartViewModel.shared)
    }
}
