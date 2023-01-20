//
//  ProfileView.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//

import SwiftUI
import FirebaseFirestore

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    @StateObject var viewModel: ProfileViewModel
    
    var body: some View {
        
        VStack {
            VStack (alignment: .leading) {
                HStack {
                    Image(systemName: "person.crop.rectangle.stack")
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .padding()
                        .clipShape(Circle())
                        .onTapGesture {
                            isAvaAlertPresented.toggle()
                        }
                        .confirmationDialog("откуда взять фотку?", isPresented: $isAvaAlertPresented) {
                            Button {
                                print("библиотека")
                            } label: {
                                Text("Из галереии")
                            }
                            
                            Button {
                                print("camera")
                            } label: {
                                Text("c камеры")
                            }

                        }
                    
                    VStack (alignment: .leading, spacing: 12){
                        TextField("Имя", text: $viewModel.profile.name)
                            .bold()
                        TextField("Компания", text: $viewModel.profile.compani)
                        
                        HStack {
                            Text("+7")
                            TextField("Телефон", value: $viewModel.profile.phone, format: .number)
                        }
                    }
                }
                VStack (alignment: .leading){
                    Text("Специальность: ортопед ")
                    Text("Сертификат: 140934 до 2025г ")
                    HStack {
                        Text("Адрес:")
                        TextField("адрес", text: $viewModel.profile.address)
                    }
                }
                // таблица с заказами
                List {
                    if viewModel.orders.count == 0 {
                        Text ("Ваши заказы будут тут!")
                    } else {
                        ForEach (viewModel.orders, id: \.id) { order in
                            OrderCell(order: order)
                        }
                    }
                    
                }.listStyle(.plain)
            }
            .padding()
            // Кнопка выхода из профиля
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Выйти")
                    .padding(8)
                    .frame(maxWidth: 155)
                    .foregroundColor(.white)
                    .background(LinearGradient(colors: [Color("ColorLightBlue"), Color("ColorBlue")], startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(10)
            }
            .confirmationDialog("Точно выйти?", isPresented: $isQuitAlertPresented) {
                Button {
                    isAuthViewPresented.toggle()
                } label: {
                    Text("Да")
                }

            }
            
            .padding(.bottom,30)
            .fullScreenCover(isPresented: $isAuthViewPresented) {
                AuthView()
            }
        }
        .onSubmit {
            viewModel.setProfile()
        }
        
        .onAppear{
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: DataUser(id: "",
                                                                  name: "",
                                                                  phone: 9262775950,
                                                                  address: "",
                                                                  compani: "")))
    }
}
