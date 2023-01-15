//
//  ProfileView.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    var body: some View {
        
        VStack {
            VStack (alignment: .leading) {
                HStack {
                    Image("userIcon")
                        .resizable()
                        .frame(width: 80, height: 80, alignment: .center)
                        .padding()
                        .background(Color.gray)
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
                        Text("Иванов Иван Иванович")
                            .bold()
                        Text("ООО Рога и копыта")
                        Text("+7 926 222 33 11")
                    }
                }
                VStack (alignment: .leading){
                    Text("Специальность: ортопед ")
                    Text("Сертификат: 140934 до 2025г ")
                    Text("Адрес: г.Москва, ул. Гагарина 17а ")
                }
                // таблица с заказами
                List {
                    Text ("Ваши заказы будут тут!")
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
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
