//
//  ContentView.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//

import SwiftUI

struct AuthView: View {
    
    @State private var isAuth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    // проверка совпадения пароля при создании аккаунта
    @State private var isShowAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        
        VStack (spacing: 50) {
            
            Image ("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal, 60)
                .padding(.bottom, 150)
            
            ZStack {
                
                VStack {
                    
                    Text(isAuth ? "Авторизация" : "Регистрация")
                        .padding(isAuth ? 16 : 24)
                        .padding(.horizontal, 40)
                        .font(.title3.bold())
                        .foregroundColor(.white)
                        .background(Color("ColorAlpha"))
                        .cornerRadius(10)
                        .padding(.bottom, 40)
                    
                    TextField("e-mail", text: $email)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("ColorAlpha"))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                    
                    SecureField("password", text: $password)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color("ColorAlpha"))
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                    
                    if !isAuth {
                        SecureField("Повторите пароль", text: $confirmPassword)
                            .padding()
                            .foregroundColor(.white)
                            .background(Color("ColorAlpha"))
                            .cornerRadius(10)
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                    }
                    
                    
                    HStack {
                        
                        Button {
                            
                            if isAuth {
                                print("Авторизация через Firebase")
                                
                                AuthService.shared.signIn(email: self.email,
                                                          password: self.password) { result in
                                    switch result {
                                        
                                    case .success(_):
                                        
                                        isTabViewShow.toggle()
                                    case .failure(let error):
                                        alertMessage = "Ошибка авторизации: \(error.localizedDescription)"
                                        isShowAlert.toggle()
                                    }
                                }

                            } else {
                                print("Создать")
                                
                                guard password == confirmPassword else {
                                    self.alertMessage = "Пароли не совпадают"
                                    self.isShowAlert.toggle()
                                    return
                                }
                                
                                AuthService.shared.signUp(email: self.email,
                                                          password: self.password) { result in
                                    switch result {
                                        
                                    case .success(let user):
                                        alertMessage = "Вы зарегистрировались с email \(user.email!)"
                                        self.isShowAlert.toggle()
                                        self.email = ""
                                        self.password = ""
                                        self.confirmPassword = ""
                                        self.isAuth.toggle()
                                    case .failure(let error):
                                        alertMessage = "Ошибка регистрации \(error.localizedDescription)"
                                        self.isShowAlert.toggle()
                                    }
                                }
                                
                                
                                
                            }
                            
                        } label: {
                            Text(isAuth ? "Вход" : "Создать")
                                .padding()
                                .frame(maxWidth: 155)
                                .foregroundColor(.white)
                                .background(LinearGradient(colors: [Color("ColorLightBlue"), Color("ColorBlue")], startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                        }
                        
                        Button {
                            isAuth.toggle()
                        } label: {
                            Text(isAuth ? "Регистрация" : "Вернуться")
                                .padding()
                                .frame(maxWidth: 155)
                                .foregroundColor(.blue)
                                .background(Color("ColorAlpha"))
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.top, 30)
                .padding(.bottom)
                .background(Color("ColorAlpha"))
                .cornerRadius(20)
                .alert(alertMessage,
                       isPresented: $isShowAlert) {
                    Button { } label: {
                        Text("Ok")
                    }

                }
                
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Image ("222").blur(radius: isAuth ? 0 : 12))
        .animation(Animation.easeInOut(duration: 0.3), value: isAuth)
        .fullScreenCover(isPresented: $isTabViewShow) {
            
            if AuthService.shared.currentUser?.uid == "IBUwHpJYoSfmfVcyZLjVMLZdsh32" {
                AdminOrdersView()
            } else {
                let mainTabBarViewModel = MainTabBarViewModel(user: AuthService.shared.currentUser!)
                
                MainTabBar(viewModel: mainTabBarViewModel)
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
