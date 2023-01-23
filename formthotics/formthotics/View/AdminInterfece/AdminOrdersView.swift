//
//  AdminOrdersView.swift
//  formthotics
//
//  Created by Vasiliy on 20.01.2023.
//

import SwiftUI

struct AdminOrdersView: View {
    
    @StateObject var viewModel = AdminOrdersViewModel()
    @State var isOrderViewShow = false
    @State var isShowAuthView = false
    
    var body: some View {
        
        
        VStack{
            HStack{
                
                Button {
                    AuthService.shared.signOut()
                    isShowAuthView.toggle()
                } label: {
                    Text("Выход")
                        .foregroundColor(.pink)
                }
                
                Spacer()
                
                Button {
                    print("Добавить товар")
                } label: {
                    Text("Добавить")
                }
                
                Spacer()
                
                Button {
                    viewModel.getOrders()
                } label: {
                    Text("Обновить")
                }
            } .padding(.horizontal, 40)
            

            
            List{
                ForEach(viewModel.orders, id: \.id) { order in
                    OrderCell(order: order)
                        .onTapGesture {
                            viewModel.currentOrder = order
                            isOrderViewShow.toggle()
                        }
                }
            }
            .listStyle(.plain)
                .onAppear{
                    viewModel.getOrders()
                }
                .sheet(isPresented: $isOrderViewShow) {
                    let orderViewModel = OrderViewModel(order: viewModel.currentOrder)
                    OrderView(viewModel: orderViewModel)
                }
        }
        .fullScreenCover(isPresented: $isShowAuthView) {
            AuthView()
        }
        
    }
}

struct AdminOrdersView_Previews: PreviewProvider {
    static var previews: some View {
        AdminOrdersView()
    }
}
