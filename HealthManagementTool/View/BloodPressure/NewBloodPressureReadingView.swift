//
//  NewBloodPressureReadingView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import SwiftUI

struct NewBloodPressureReadingView: View {
    @ObservedObject var bloodPressureReadings = BloodPressureViewModel()
    @Binding var bloodPressureReading: BloodPressureModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("Date: ").font(.system(size: 18))
                        TextField("", text: $bloodPressureReading.date).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Time: ").font(.system(size: 18))
                        TextField("", text: $bloodPressureReading.time).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Systolic Reading (top number): ").font(.system(size: 18))
                        TextField("", text: $bloodPressureReading.systolic).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Diastolic Reading (bottom number): ").font(.system(size: 18))
                        TextField("", text: $bloodPressureReading.diastolic).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Pulse (beats per minute): ").font(.system(size: 18))
                        TextField("", text: $bloodPressureReading.pulse).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Notes: ").padding([.top], 0).font(.system(size: 18))
                        TextEditor(text: $bloodPressureReading.notes).foregroundColor(.gray)
                    }
                }
                .padding([.top, .bottom], 5)
            }
        header: {
            Text("New Blood Pressure Reading").foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                Button {
                    bloodPressureReadings.saveData(bloodPressureReading: bloodPressureReading)
                    bloodPressureReading.date = ""
                    bloodPressureReading.time = ""
                    bloodPressureReading.systolic = ""
                    bloodPressureReading.diastolic = ""
                    bloodPressureReading.pulse = ""
                    bloodPressureReading.notes = ""
                    bloodPressureReading.userId = ""
                }
            label: {
                Label("Add", systemImage: "plus").font(.system(size: 18))
                }
            }

        }
    }
}

//#Preview {
    //NewBloodPressureReadingView()
//}
