//
//  NewMedicationView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/27/24.
//

import SwiftUI

struct NewMedicationView: View {
    @ObservedObject var medications = MedicationViewModel()
    @Binding var medication: MedicationModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("Name: ").font(.system(size: 18))
                        TextField("", text: $medication.name).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Category: ").font(.system(size: 18))
                        TextField("", text: $medication.category).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Prescription Number: ").font(.system(size: 18))
                        TextField("", text: $medication.prescriptionNumber).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Dose: ").font(.system(size: 18))
                        TextField("", text: $medication.dose).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Route: ").font(.system(size: 18))
                        TextField("", text: $medication.route).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Prescribing Physician: ").font(.system(size: 18))
                        TextField("", text: $medication.prescribingPhysician).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Time(s): ").font(.system(size: 18))
                        TextField("", text: $medication.time).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Start Date: ").font(.system(size: 18))
                        TextField("", text: $medication.startDate).foregroundColor(.gray)
                    }
                    HStack {
                        Text("End Date: ").font(.system(size: 18))
                        TextField("", text: $medication.endDate).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Refill Date: ").font(.system(size: 18))
                        TextField("", text: $medication.refillDate).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Expiration Date: ").font(.system(size: 18))
                        TextField("", text: $medication.expirationDate).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Notes: ").padding([.top], 0).font(.system(size: 18))
                        TextEditor(text: $medication.notes).foregroundColor(.gray)
                    }
                }
                .padding([.top, .bottom], 5)
            }
        header: {
            Text("New Medication").foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                //                .toolbar {
                //                    ToolbarItem(placement: .navigationBarLeading) {
                //                        Button {
                //                            medications.saveData(medication: medication)
                //                            medication.dose = ""
                //                            medication.endDate = ""
                //                            medication.expirationDate = ""
                //                            medication.name = ""
                //                            medication.notes = ""
                //                            medication.prescribingPhysician = ""
                //                            medication.prescriptionNumber = ""
                //                            medication.refillDate = ""
                //                            medication.route = ""
                //                            medication.startDate = ""
                //                            medication.time = ""
                //                            medication.userId = ""
                //                        } label: {
                //                            Label("Update Medication", systemImage: "square.and.pencil")
                //                        }
                //                    }
                //                    ToolbarItem(placement: .navigationBarTrailing) {
                //                        Button {
                //                            medications.saveData(medication: medication)
                //                        } label: {
                //                            Label("Delete Medication", systemImage: "trash")
                //                        }
                //
                //                    }
                //                }
                Button {
                    medications.saveData(medication: medication)
                    medication.category = ""
                    medication.dose = ""
                    medication.endDate = ""
                    medication.expirationDate = ""
                    medication.name = ""
                    medication.notes = ""
                    medication.prescribingPhysician = ""
                    medication.prescriptionNumber = ""
                    medication.refillDate = ""
                    medication.route = ""
                    medication.startDate = ""
                    medication.time = ""
                    medication.userId = ""
                }
            label: {
                Label("Add \(medication.name)", systemImage: "plus").font(.system(size: 18))
            }
                //                .alert("", isPresented: $medications.showAlert) {
                //                    Button("OK", role: .cancel) { }
                //                }
                //                message: {
                //                    Text(medications.userMessage)
                //                }
            }
                //                .alert("", isPresented: $medications.showAlert) {
                //                    Button("OK", role: .cancel) { }
                //                }
                //                message: {
                //                    Text(medications.userMessage)
                //                }
                //                NavigationLink(destination: MedicationsView()) {
                //                    Button(action: {
                //                        medications.saveData(medication: medication)
                //                        medication.dose = ""
                //                        medication.endDate = ""
                //                        medication.expirationDate = ""
                //                        medication.name = ""
                //                        medication.notes = ""
                //                        medication.prescribingPhysician = ""
                //                        medication.prescriptionNumber = ""
                //                        medication.refillDate = ""
                //                        medication.route = ""
                //                        medication.startDate = ""
                //                        medication.time = ""
                //                        medication.userId = ""
                //                    },
                //                    label: {
                //                          Label("Update Medication Details", systemImage: "square.and.pencil")
                //                    })
                //                }
                //                NavigationLink(destination: MedicationsView()) {
                //                    Button(action: {
                //                        medications.deleteData(medication: medication)
                //                    }, label: {
                //                        Label("Delete Medication", systemImage: "trash")
                //                    })
                //                }
        }
    }
}

//#Preview {
    //MedicationDetails()
//}


//#Preview {
    //NewMedicationView()
//}
