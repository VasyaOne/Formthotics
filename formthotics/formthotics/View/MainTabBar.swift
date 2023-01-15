//
//  MainTapBar.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//        .background(Color("ColorAlpha"))

import SwiftUI

struct MainTabBar: View {
    
//    init() { // задает цвет TabBar
//        UITabBar.appearance().backgroundColor = UIColor.white
//        UITabBar.appearance().barTintColor = UIColor.black
//        UITabBar.appearance().unselectedItemTintColor = UIColor.black
//    }
    
    var viewModel: MainTabBarViewModel
        
    var body: some View {
        
        TabView {
            
            NewsView()
                .tabItem {
                    VStack {
                        Image(systemName: "house.fill")
                        Text("Новости")
                    }
                }
            
            NavigationView {
                CatalogView()
            }
                .tabItem {
                    VStack {
                        Image(systemName: "book")
                        Text("Каталог")
                    }
                }
            
            CartView(viewModel: CartViewModel.shared)
                .tabItem {
                    VStack {
                        Image(systemName: "cart")
                        Text("Корзина")
                    }
                }
            
            ProfileView()
                .tabItem {
                    VStack {
                        Image(systemName: "person.circle")
                        Text("Профиль")
                    }
                }
        }
        
    }
}
//
//struct MainTabBar_Previews: PreviewProvider {
//    static var previews: some View {
//        MainTabBar(viewModel: MainTabBarViewModel(user: User()))
//    }
//}
