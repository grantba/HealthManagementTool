//
//  EditPharmacyView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import SwiftUI

struct EditPharmacyView: View {
    @ObservedObject var pharmacies = PharmacyViewModel()
    @Binding var pharmacy: PharmacyModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("Name: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.name).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Street Address: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.streetAddress).foregroundColor(.gray)
                    }
                    HStack {
                        Text("City: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.city).foregroundColor(.gray)
                    }
                    HStack {
                        Text("State: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.state).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Postal Code: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.postalCode).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Phone Number: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.phoneNumber).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Fax Number: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.faxNumber).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Email: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.email).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Website URL: ").font(.system(size: 18))
                        TextField("", text: $pharmacy.url).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Notes: ").padding([.top], 0).font(.system(size: 18))
                        TextEditor(text: $pharmacy.notes).foregroundColor(.gray)
                    }
                }
                .padding([.top, .bottom], 5)
            }
        header: {
            Text(pharmacy.name).foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                Button {
                    pharmacies.saveData(pharmacy: pharmacy)
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
                Label("Save", systemImage: "square.and.pencil").font(.system(size: 18))
                }
            }
        }
    }
}

//#Preview {
    //EditPharmacyView()
//}
