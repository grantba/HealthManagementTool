//
//  ContentView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/6/24.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        if authManager.isSignedIn {
            ListView()
        } else {
            PageLoadView()
        }
    }
}

#Preview {
    ContentView()
}
