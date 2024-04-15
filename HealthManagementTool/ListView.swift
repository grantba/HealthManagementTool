//
//  ListView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/14/24.
//

import SwiftUI
import Firebase

struct ListView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
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
