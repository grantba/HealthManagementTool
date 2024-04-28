//
//  AddMedicationView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/20/24.
//

import SwiftUI

struct PharmaciesView: View {
    @ObservedObject var pharmacies = PharmacyViewModel()
    @State var pharmacy = PharmacyModel(name: "", streetAddress: "", city: "", state: "", postalCode: "", phoneNumber: "", faxNumber: "", email: "", url: "", notes: "", userId: "")
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("Pharmacies") {
                    ForEach($pharmacies.pharmacies) { $pharmacy in
                        NavigationLink {
                            PharmacyDetails(pharmacy: $pharmacy)
                        }
                    label: {
                        Text(pharmacy.name)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            .underline()
                    }
                        NavigationLink {
                            EditPharmacyView(pharmacy: $pharmacy)
                        }
                    label: {
                        Label("Edit \(pharmacy.name) Details", systemImage: "square.and.pencil")
                    }
                    .font(.system(size: 16, weight: .regular))
                    .padding([.leading], 30)
                    }
                }
                .foregroundColor(.blue)
                .font(.system(size: 20, weight: .semibold))
            }
            NavigationLink(destination: NewPharmacyView(pharmacy: $pharmacy)) {
                Button {
                // add pharmacy
                } label: {
                    Label("Add Pharmacy", systemImage: "plus").font(.system(size: 18))
                }
            }
        }
        .onAppear {
            pharmacies.fetchData()
        }
        .refreshable {
            pharmacies.fetchData()
        }
    }
}

//#Preview {
    //PharmaciesView()
//}
