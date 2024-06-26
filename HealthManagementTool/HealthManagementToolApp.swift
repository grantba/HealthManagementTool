//
//  HealthManagementToolApp.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/6/24.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
      
class AppDelegate: NSObject, UIApplicationDelegate {
      func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
      }
}

@main
struct HealthManagementToolApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authManager = AuthManager()

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authManager)
        }
    }
}
