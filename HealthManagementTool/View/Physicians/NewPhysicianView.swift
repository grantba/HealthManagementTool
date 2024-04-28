//
//  NewPhysicianView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/27/24.
//

import SwiftUI

struct NewPhysicianView: View {
    @ObservedObject var physicians = PhysicianViewModel()
    @Binding var physician: PhysicianModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("First Name: ").font(.system(size: 18))
                        TextField("", text: $physician.firstName).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Last Name: ").font(.system(size: 18))
                        TextField("", text: $physician.lastName).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Street Address: ").font(.system(size: 18))
                        TextField("", text: $physician.streetAddress).foregroundColor(.gray)
                    }
                    HStack {
                        Text("City: ").font(.system(size: 18))
                        TextField("", text: $physician.city).foregroundColor(.gray)
                    }
                    HStack {
                        Text("State: ").font(.system(size: 18))
                        TextField("", text: $physician.state).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Postal Code: ").font(.system(size: 18))
                        TextField("", text: $physician.postalCode).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Phone Number: ").font(.system(size: 18))
                        TextField("", text: $physician.phoneNumber).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Fax Number: ").font(.system(size: 18))
                        TextField("", text: $physician.faxNumber).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Email: ").font(.system(size: 18))
                        TextField("", text: $physician.email).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Website URL: ").font(.system(size: 18))
                        TextField("", text: $physician.url).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Notes: ").padding([.top], 0).font(.system(size: 18))
                        TextEditor(text: $physician.notes).foregroundColor(.gray)
                    }
                }
                .padding([.top, .bottom], 5)
            }
        header: {
            Text("New Physician").foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                Button {
                    physicians.saveData(physician: physician)
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
                Label("Add", systemImage: "plus").font(.system(size: 18))
                }
            }

        }
    }
}

//#Preview {
    //NewPhysicianView()
//}
