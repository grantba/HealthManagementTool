//
//  AuthManager.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/14/24.
//

import Foundation
import Firebase

@MainActor
class AuthManager: ObservableObject {
    //@Published var user: User?
    @Published var isSignedIn: Bool = false
    @Published var showAlert: Bool = false
    @Published var errorMessage: String = "Unknown error: Please try again"
    
    init() {
        Auth.auth().addStateDidChangeListener() { auth, user in
            if user != nil {
                self.isSignedIn = true
                print("Auth state changed, is signed in")
            } else {
                self.isSignedIn = false
                print("Auth state changed, is signed out")
            }
        }
    }
    
    func signup(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if error != nil {
                self.showAlert = true
                self.errorMessage = error?.localizedDescription ?? self.errorMessage
            }
        }
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                self.showAlert = true
                self.errorMessage = error?.localizedDescription ?? self.errorMessage
            }
        }
    }
    
    func logout() {
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
        }
    }
}
