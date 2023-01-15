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
            AuthView()
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
