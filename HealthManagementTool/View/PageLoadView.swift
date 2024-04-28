//
//  PageLoadView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/20/24.
//

import SwiftUI
import Firebase

struct PageLoadView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
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
                    authManager.signup(email: email, password: password)
                }
                    label: {
                        Text("Sign up")
                            .bold()
                            .frame(width: 200, height: 40)
                            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).fill(.blue))
                            .foregroundColor(.white)
                    }
                    .alert("Error", isPresented: $authManager.showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("\(authManager.errorMessage) \("Please try again.")")
                    }
                Button {
                    authManager.login(email: email, password: password)
                }
                    label: {
                        Text("Already have an account? Login")
                            .underline()
                            .bold()
                            .frame(width: 300, height: 60)
                            .foregroundColor(.white)
                        }
                    .alert("Error", isPresented: $authManager.showAlert) {
                        Button("OK", role: .cancel) { }
                    } message: {
                        Text("\(authManager.errorMessage) \("Please try again.")")
                    }
                .onAppear {
                    email = ""
                    password = ""
                }
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PageLoadView()
}
