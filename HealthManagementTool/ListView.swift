//
//  ListView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/14/24.
//

import SwiftUI
import Firebase

struct ListView: View {
//    @EnvironmentObject var authManager: AuthManager
    
    var body: some View {
            Text("View Medications")
            Text("Add Medications")
            Text("View Physicians")
            Text("Add Physician")
            Button {
                logout()
            }
            label: {
                Text("Logout")
                    .bold()
                    .frame(width: 300, height: 40)
                    .foregroundColor(.black)
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

#Preview {
    ListView()
}
