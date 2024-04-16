//
//  ContentView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/6/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
//    @EnvironmentObject var authManager: AuthManager
    @State var isLoggedIn: Bool = false
    @State private var email = ""
    @State private var password = ""
    @State var showAlert = false
    @State var errorMessage = "Unknown error: Please try again"

    var body: some View {
        if isLoggedIn {
            ListView(isLoggedIn: $isLoggedIn)
        } else {
            onPageLoadView
        }
    }
        
    var onPageLoadView: some View {
        ZStack {
            Color.black
            VStack(spacing: 20) {
                Image("HealthcareImage")
                    .resizable()
                    .frame(width: 300, height: 150)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 4)
                    )                
                Text("Welcome to the Health Management Application")
                    .foregroundColor(.blue)
                    .font(.system(size: 40, weight: .bold, design: .rounded))
                TextField("Email", text: $email)
                    .foregroundColor(.black)
                    .bold()
                    .textFieldStyle(.roundedBorder)
                    .padding([.top, .leading, .trailing], 30)
                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .bold()
                    .textFieldStyle(.roundedBorder)
                    .padding([.leading, .trailing, .bottom], 30)
                Button {
//                    let message = authManager.signup(email: email, password: password) 
//                    if (message != "") {
//                        showAlert = true
//                        errorMessage = message 
//                    }
                    signup()
                }
                    label: {
                        Text("Sign up")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.blue))
                            .foregroundColor(.white)
                    }
                    .alert("Error", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("\(errorMessage) \("Please try again.")")
                    }
                Button {
//                    let message = authManager.login(email: email, password: password) 
//                    if (message != "") {
//                        showAlert = true
//                        errorMessage = message 
//                    }
                    login()
                }
                    label: {
                        Text("Already have an account? Login")
                            .underline()
                            .bold()
                            .frame(width: 300, height: 60)
                            .foregroundColor(.white)
                        }
                    .alert("Error", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("\(errorMessage) \("Please try again.")")
                    }
                .onAppear {
                    email = ""
                    password = ""
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            isLoggedIn.toggle()
                        }
                    }
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
    
    func signup() {
        Auth.auth().createUser(withEmail: email, password: password) {
            result, error in
            if error != nil {
                showAlert = true
                errorMessage = error?.localizedDescription ?? errorMessage
            }
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) {
            result, error in
            if error != nil {
                showAlert = true
                errorMessage = error?.localizedDescription ?? errorMessage
            }
        }
    }
}

#Preview {
    ContentView()
}
