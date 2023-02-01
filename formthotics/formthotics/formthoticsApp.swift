//
//  formthoticsApp.swift
//  formthotics
//
//  Created by Vasiliy on 11.01.2023.
//

import SwiftUI
import Firebase

let screen = UIScreen.main.bounds

@main
struct formthoticsApp: App {
    
    @UIApplicationDelegateAdaptor private var appDelegate: AppDelegate
    
    var body: some Scene {
        WindowGroup {
            
            if let user = AuthService.shared.currentUser {
                if user.uid == "j7kUI8sonKYuqkjFU7O1gP0LHxg2"{
                    AdminOrdersView()
                } else {
                    let viewModel = MainTabBarViewModel(user: user)
                    MainTabBar(viewModel: viewModel)
                }
                    
            } else {
                AuthView()
            }
        }
    }
    
    class AppDelegate: NSObject, UIApplicationDelegate{
        
        func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
            
            FirebaseApp.configure()
            print("Ok!")
            
            return true
        }
        
    }
    
    
    
}
