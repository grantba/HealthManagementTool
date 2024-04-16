//
//  AuthManager.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/14/24.
//

//import Foundation
//import Firebase
//
//enum AuthState {
//    case authenticated
//    case signedIn
//    case signedOut
//    case errorMessage
//}
//
//@MainActor
//class AuthManager: ObservableObject {
//    @Published var user: User?
//    @Published var authState = AuthState.signedOut
//    @Published var errorMessage = AuthState.errorMessage
//    
//    func signup(email: String, password: String) -> String {
//        var errorMessage = ""
//        Auth.auth().createUser(withEmail: email, password: password) {
//            result, error in
//            if error != nil {
//                errorMessage = error?.localizedDescription ?? ""
//            } else {
//                errorMessage = ""
//            }
//        }
//        return errorMessage
//    }
//    
//    func login(email: String, password: String) -> String {
//        var errorMessage = ""
//        Auth.auth().signIn(withEmail: email, password: password) {
//            result, error in
//            if error != nil {
//                errorMessage = error?.localizedDescription ?? ""
//            } else {
//                errorMessage = ""
//            }
//        }
//        return errorMessage
//    }
//    
//    func logout() {
//        do {
//            try Auth.auth().signOut()
//        } catch let signOutError as NSError {
//            print("Error signing out: %@", signOutError)
//        }
//    }
//}
