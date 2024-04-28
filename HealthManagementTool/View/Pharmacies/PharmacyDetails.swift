//
//  PharmacyDetails.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import SwiftUI

struct PharmacyDetails: View {
    @ObservedObject var pharmacies = PharmacyViewModel()
    @Binding var pharmacy: PharmacyModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("Name: ").font(.system(size: 18))
                        Text(pharmacy.name).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Street Address: ").font(.system(size: 18))
                        Text(pharmacy.streetAddress).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("City: ").font(.system(size: 18))
                        Text(pharmacy.city).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("State: ").font(.system(size: 18))
                        Text(pharmacy.state).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Postal Code: ").font(.system(size: 18))
                        Text(pharmacy.postalCode).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Phone Number: ").font(.system(size: 18))
                        Text(pharmacy.phoneNumber).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Fax Number: ").font(.system(size: 18))
                        Text(pharmacy.faxNumber).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Email: ").font(.system(size: 18))
                        Text(pharmacy.email).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Website URL: ").font(.system(size: 18))
                        Text(pharmacy.url).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Notes: ").font(.system(size: 18))
                        Text(pharmacy.notes).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .padding(2)
                }
            }
        header: {
            Text(pharmacy.name).foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                Button {
                    pharmacies.deleteData(pharmacy: pharmacy)
                    pharmacy.name = ""
                    pharmacy.streetAddress = ""
                    pharmacy.city = ""
                    pharmacy.state = ""
                    pharmacy.postalCode = ""
                    pharmacy.phoneNumber = ""
                    pharmacy.faxNumber = ""
                    pharmacy.email = ""
                    pharmacy.url = ""
                    pharmacy.notes = ""
                    pharmacy.userId = ""
                }
            label: {
                Label("Delete", systemImage: "trash").foregroundColor(.red).font(.system(size: 18))
                }
            }
        }
    }
}


//#Preview {
    //PharmacyDetails()
//}
