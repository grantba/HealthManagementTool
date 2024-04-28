//
//  PhysicianDetails.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/27/24.
//

import SwiftUI

struct PhysicianDetails: View {
    @ObservedObject var physicians = PhysicianViewModel()
    @Binding var physician: PhysicianModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("First Name: ").font(.system(size: 18))
                        Text(physician.firstName).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Last Name: ").font(.system(size: 18))
                        Text(physician.lastName).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Street Address: ").font(.system(size: 18))
                        Text(physician.streetAddress).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("City: ").font(.system(size: 18))
                        Text(physician.city).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("State: ").font(.system(size: 18))
                        Text(physician.state).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Postal Code: ").font(.system(size: 18))
                        Text(physician.postalCode).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Phone Number: ").font(.system(size: 18))
                        Text(physician.phoneNumber).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Fax Number: ").font(.system(size: 18))
                        Text(physician.faxNumber).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Email: ").font(.system(size: 18))
                        Text(physician.email).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Website URL: ").font(.system(size: 18))
                        Text(physician.url).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Notes: ").font(.system(size: 18))
                        Text(physician.notes).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .padding(2)
                }
            }
        header: {
            Text("\(physician.lastName), \(physician.firstName)").foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                Button {
                    physicians.deleteData(physician: physician)
                    physician.firstName = ""
                    physician.lastName = ""
                    physician.streetAddress = ""
                    physician.city = ""
                    physician.state = ""
                    physician.postalCode = ""
                    physician.phoneNumber = ""
                    physician.faxNumber = ""
                    physician.email = ""
                    physician.url = ""
                    physician.notes = ""
                    physician.userId = ""
                }
            label: {
                Label("Delete", systemImage: "trash").foregroundColor(.red).font(.system(size: 18))
                }
            }
        }
    }
}


//#Preview {
    //PhysicianDetails()
//}
