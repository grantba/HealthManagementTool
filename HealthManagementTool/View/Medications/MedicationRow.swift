//
//  MedicationRow.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/21/24.
//

import SwiftUI

struct MedicationRow: View {
    @Binding var medication: MedicationModel
    @ObservedObject var medications = MedicationViewModel()
    //@State var medication = MedicationModel(userId: "", name: "", dose: "", route: "", prescribingPhysician: "")
        
    var body: some View {
        //Text(food.icon)
        //        Text(medication.name)
        //        Text(medication.dose)
        //        Spacer()

//                HStack {
//                    Button(action: {
//                        MedicationEditView(medication: medication)
//                    }, label: {
//                        Label("Edit", systemImage: "square.and.pencil")
//                    })
//                    Divider().padding([.trailing, .leading], 50)
//                    Button(action: {
//                        MedicationEditView(medication: medication)
//                    }, label: {
//                        Label("Delete", systemImage: "trash")
//                    })
//                }
            }
        }
    }
}
