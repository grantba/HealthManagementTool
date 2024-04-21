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
        Text("Welcome, UserName!")
        NavigationStack {
            VStack {
                NavigationLink(destination: MedicationsView()) {
                    Text("View Medications")
                }
                NavigationLink(destination: AddMedicationView()) {
                    Text("Add Medication")
                }
                NavigationLink(destination: PhysiciansView()) {
                    Text("View Physicians")
                }
                NavigationLink(destination: AddPhysicianView()) {
                    Text("Add Physician")
                }
            }
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
