//
//  PhysiciansView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/20/24.
//

import SwiftUI

struct PhysiciansView: View {
    @ObservedObject var physicians = PhysicianViewModel()
    @State var physician = PhysicianModel(firstName: "", lastName: "", streetAddress: "", city: "", state: "", postalCode: "", phoneNumber: "", faxNumber: "", email: "", url: "", notes: "", userId: "")
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("Physicians") {
                    ForEach($physicians.physicians) { $physician in
                        NavigationLink {
                            PhysicianDetails(physician: $physician)
                        }
                    label: {
                        Text("\(physician.lastName), \(physician.firstName)")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            .underline()
                    }
                        NavigationLink {
                            EditPhysicianView(physician: $physician)
                        }
                    label: {
                        Label("Edit \(physician.lastName), \(physician.firstName) Details", systemImage: "square.and.pencil")
                    }
                    .font(.system(size: 16, weight: .regular))
                    .padding([.leading], 30)
                    }
                }
                .foregroundColor(.blue)
                .font(.system(size: 20, weight: .semibold))
            }
            NavigationLink(destination: NewPhysicianView(physician: $physician)) {
                Button {
                // add physician
                } label: {
                    Label("Add Physician", systemImage: "plus").font(.system(size: 18))
                }
            }
        }
        .onAppear {
            physicians.fetchData()
        }
        .refreshable {
            physicians.fetchData()
        }
    }
}

//#Preview {
    //PhysiciansView()
//}
