//
//  ContentView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/6/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    @State private var showAlert = false
    @State private var errorMessage = "Unknown error: Please try again"

    var body: some View {
        if userIsLoggedIn {
            ListView()
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
                    login()
                }
                    label: {
                        Text("Already have an account?\nLogin")
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
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            userIsLoggedIn.toggle()
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
