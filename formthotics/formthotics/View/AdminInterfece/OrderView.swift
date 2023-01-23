//
//  OrderView.swift
//  formthotics
//
//  Created by Vasiliy on 20.01.2023.
//

import SwiftUI

struct OrderView: View {
    
    @StateObject var viewModel: OrderViewModel
    var statuses: [String] {
        var sts = [String]()
        
        for status in OrderStatus.allCases {
            sts.append(status.rawValue)
        }
        return sts
    }
    
    var body: some View {
        
        VStack (alignment: .leading){
            Text("\(viewModel.user.name)")
                .font(.title3)
                .bold()
            Text("+7 \(viewModel.user.phone)")
            Text("\(viewModel.user.address)")
            
            Picker (selection: $viewModel.order.status) {
                ForEach(statuses, id: \.self) { status in
                    Text(status)
                }
            } label: {
                Text("Статус заказа")
            }
            .pickerStyle(.segmented)
            .onChange(of: viewModel.order.status) { newValue in
                DatabaseService.shared.setOrder(order: viewModel.order) { result in
                    switch result {
                    case .success(let order):
                        print(order.status)
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }

            
            
            List {
                ForEach(viewModel.order.positions, id: \.id) { position in
                    PositionCell(position: position)
                }
                
                Text("Итого: \(viewModel.order.cost) руб")
            }
        }.padding()
            .onAppear{
                viewModel.getUserData()
            }
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView(viewModel: OrderViewModel(order: Order(userID: "", date: Date(), status: "")))
    }
}
