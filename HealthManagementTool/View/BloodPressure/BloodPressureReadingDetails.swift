//
//  BloodPressureReadingDetails.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import SwiftUI

struct BloodPressureReadingDetails: View {
    @ObservedObject var bloodPressureReadings = BloodPressureViewModel()
    @Binding var bloodPressureReading: BloodPressureModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("Date: ").font(.system(size: 18))
                        Text(bloodPressureReading.date).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Time: ").font(.system(size: 18))
                        Text(bloodPressureReading.time).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Systolic Reading (top number): ").font(.system(size: 18))
                        Text(bloodPressureReading.systolic).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Diastolic Reading (bottom number): ").font(.system(size: 18))
                        Text(bloodPressureReading.diastolic).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Pulse (beats per minute): ").font(.system(size: 18))
                        Text(bloodPressureReading.pulse).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(2)
                    HStack {
                        Text("Notes: ").font(.system(size: 18))
                        Text(bloodPressureReading.notes).font(.system(size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .bottomLeading)
                    .padding(2)
                }
            }
        header: {
            Text("Blood Pressure Reading Taken \(bloodPressureReading.date) at \(bloodPressureReading.time)").foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                Button {
                    bloodPressureReadings.deleteData(bloodPressureReading: bloodPressureReading)
                    bloodPressureReading.date = ""
                    bloodPressureReading.time = ""
                    bloodPressureReading.systolic = ""
                    bloodPressureReading.diastolic = ""
                    bloodPressureReading.pulse = ""
                    bloodPressureReading.notes = ""
                    bloodPressureReading.userId = ""
                }
            label: {
                Label("Delete", systemImage: "trash").foregroundColor(.red).font(.system(size: 18))
                }
            }
        }
    }
}

//#Preview {
    //BloodPressureReadingDetails()
//}
