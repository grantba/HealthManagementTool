//
//  MedicationDetails.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/22/24.
//

import SwiftUI

struct MedicationDetails: View {
    @ObservedObject var medications = MedicationViewModel()
    @Binding var medication: MedicationModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("Name: ").font(.system(size: 18))
                        Text(medication.name).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Category: ").font(.system(size: 18))
                        Text(medication.category).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Prescription Number: ").font(.system(size: 18))
                        Text(medication.prescriptionNumber).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Dose: ").font(.system(size: 18))
                        Text(medication.dose).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Route: ").font(.system(size: 18))
                        Text(medication.route).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Prescribing Physician: ").font(.system(size: 18))
                        Text(medication.prescribingPhysician).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Time(s): ").font(.system(size: 18))
                        Text(medication.time).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Start Date: ").font(.system(size: 18))
                        Text(medication.startDate).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("End Date: ").font(.system(size: 18))
                        Text(medication.endDate).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Refill Date: ").font(.system(size: 18))
                        Text(medication.refillDate).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Expiration Date: ").font(.system(size: 18))
                        Text(medication.expirationDate).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Notes: ").font(.system(size: 18))
                        Text(medication.notes).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .padding(2)
                }
            }
        header: {
            Text(medication.name).foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
//            Section {
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
//                Button {
//                    medications.saveData(medication: medication)
//                    medication.dose = ""
//                    medication.endDate = ""
//                    medication.expirationDate = ""
//                    medication.name = ""
//                    medication.notes = ""
//                    medication.prescribingPhysician = ""
//                    medication.prescriptionNumber = ""
//                    medication.refillDate = ""
//                    medication.route = ""
//                    medication.startDate = ""
//                    medication.time = ""
//                    medication.userId = ""
//                }
//            label: {
//                Label("Save updated medication details", systemImage: "square.and.pencil")
//            }
//                //                .alert("", isPresented: $medications.showAlert) {
//                //                    Button("OK", role: .cancel) { }
//                //                }
//                //                message: {
//                //                    Text(medications.userMessage)
//                //                }
//            }
            Section {
                Button {
                    medications.deleteData(medication: medication)
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
                Label("Delete", systemImage: "trash").foregroundColor(.red).font(.system(size: 18))
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
}

//#Preview {
    //MedicationDetails()
//}
