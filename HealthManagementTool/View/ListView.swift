//
//  ListView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/14/24.
//

import SwiftUI
import Firebase

struct ListView: View {
    @EnvironmentObject var authManager: AuthManager
    //@Binding var isLoggedIn: Bool
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 60) {
                NavigationLink(destination: MedicationsView()) {
                    HStack {
                        Image(systemName: "pills.fill")
                        Text("Medications")
                    }
                    .frame(height: 20, alignment: .leading)
                    .foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
                    .padding([.top], 40)
                    .padding([.leading, .trailing], 50)
                }
                NavigationLink(destination: PhysiciansView()) {
                    HStack {
                        Image(systemName: "person.fill")
                        Text("Physicians")
                    }
                        .frame(height: 20, alignment: .leading)
                        .foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
                        .padding([.leading, .trailing], 50)
                }
                NavigationLink(destination: PharmaciesView()) {
                    HStack {
                        Image(systemName: "cross.vial")
                        Text("Pharmacies")
                    }
                        .frame(height: 20, alignment: .leading)
                        .foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
                        .padding([.leading, .trailing], 50)
                }
                NavigationLink(destination: BloodPresureLogView()) {
                    HStack {
                        Image(systemName: "stethoscope")
                        Text("Blood Pressure Log")
                    }
                        .frame(height: 20, alignment: .leading)
                        .foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
                        .padding([.leading, .trailing], 50)
                }
                NavigationLink(destination: BloodSugarLogView()) {
                    HStack {
                        Image(systemName: "heart.text.square")
                        Text("Blood Sugar Log")
                    }
                        .frame(height: 20, alignment: .leading)
                        .foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
                        .padding([.leading, .trailing], 50)
                        .padding([.bottom], 40)
                }
            }
            .padding()
            .background(Color.blue.opacity(0.1))
            .cornerRadius(20)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.blue, lineWidth: 6)
            )
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Logout") {
                        authManager.logout()
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .padding()
            .navigationTitle("HomePage")
        }
    }
}

#Preview {
    ListView()
}
