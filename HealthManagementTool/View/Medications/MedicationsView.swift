//
//  MedicationsView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/20/24.
//

import SwiftUI

struct MedicationsView: View {   
    @EnvironmentObject var authManager: AuthManager
    @ObservedObject var medications = MedicationViewModel()
    @State var medication = MedicationModel(category: "", dose: "", endDate: "", expirationDate: "", name: "", notes: "", prescribingPhysician: "", prescriptionNumber: "", refillDate: "", route: "", startDate: "", time: "", userId: "")
    //@State private var currentMedications
    //@State private var pastMedications
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("Medications") {
                    ForEach($medications.medications) { $medication in
                        NavigationLink {
                            MedicationDetails(medication: $medication)
                        }
                    label: {
                        Text(medication.name)
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            .underline()
                    }
                        NavigationLink {
                            EditMedicationView(medication: $medication)
                        }
                    label: {
                        Label("Edit \(medication.name) details", systemImage: "square.and.pencil")
                    }
                    .font(.system(size: 16, weight: .regular))
                    .padding([.leading], 30)
                    }
                }
                .foregroundColor(.blue)
                .font(.system(size: 20, weight: .semibold))
            }
            
            //Section {
            //DisclosureGroup("Past Medications") {
            //ForEach(pastMedications) { medication in
            //MedicationRow(medication: medication)
            //}
            //}
            //}
            NavigationLink(destination: NewMedicationView(medication: $medication)) {
                Button {
                // add medication
                } label: {
                    Label("Add", systemImage: "plus").font(.system(size: 18))
                }
            }
        }
        .onAppear {
            medications.fetchData()
        }
        .refreshable {
            medications.fetchData()
        }
    }
}

//#Preview {
    //MedicationsView()
//}
