//
//  BloodSugarReadingDetails.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import SwiftUI

struct BloodSugarReadingDetails: View {
    @ObservedObject var bloodSugarReadings = BloodSugarViewModel()
    @Binding var bloodSugarReading: BloodSugarModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("Date: ").font(.system(size: 18))
                        Text(bloodSugarReading.date).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Time: ").font(.system(size: 18))
                        Text(bloodSugarReading.time).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Blood Sugar Level: ").font(.system(size: 18))
                        Text(bloodSugarReading.bloodSugarLevel).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Medications Taken: ").font(.system(size: 18))
                        Text(bloodSugarReading.meds).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Carbohydrates Eaten: ").font(.system(size: 18))
                        Text(bloodSugarReading.carbs).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Notes: ").font(.system(size: 18))
                        Text(bloodSugarReading.notes).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .padding(2)
                }
            }
        header: {
            Text("Blood Sugar Reading Taken \(bloodSugarReading.date) at \(bloodSugarReading.time)").foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                Button {
                    bloodSugarReadings.deleteData(bloodSugarReading: bloodSugarReading)
                    bloodSugarReading.date = ""
                    bloodSugarReading.time = ""
                    bloodSugarReading.bloodSugarLevel = ""
                    bloodSugarReading.meds = ""
                    bloodSugarReading.carbs = ""
                    bloodSugarReading.notes = ""
                    bloodSugarReading.userId = ""
                }
            label: {
                Label("Delete", systemImage: "trash").foregroundColor(.red).font(.system(size: 18))
                }
            }
        }
    }
}

//#Preview {
    //BloodSugarReadingDetails()
//}
