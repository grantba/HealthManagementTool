//
//  EditBloodSugarReadingView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import SwiftUI

struct EditBloodSugarReadingView: View {
    @ObservedObject var bloodSugarReadings = BloodSugarViewModel()
    @Binding var bloodSugarReading: BloodSugarModel

    var body: some View {
        List {
            Section {
                VStack
                {
                    HStack {
                        Text("Date: ").font(.system(size: 18))
                        TextField("", text: $bloodSugarReading.date).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Time: ").font(.system(size: 18))
                        TextField("", text: $bloodSugarReading.time).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Blood Sugar Level: ").font(.system(size: 18))
                        TextField("", text: $bloodSugarReading.bloodSugarLevel).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Medications Taken: ").font(.system(size: 18))
                        TextField("", text: $bloodSugarReading.meds).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Carbohydrates Eaten: ").font(.system(size: 18))
                        TextField("", text: $bloodSugarReading.carbs).foregroundColor(.gray)
                    }
                    HStack {
                        Text("Notes: ").padding([.top], 0).font(.system(size: 18))
                        TextEditor(text: $bloodSugarReading.notes).foregroundColor(.gray)
                    }
                }
                .padding([.top, .bottom], 5)
            }
        header: {
            Text("Edit Blood Sugar Reading").foregroundColor(.blue).font(.system(size: 20, weight: .semibold))
        }
        .foregroundColor(.blue)
            Section {
                Button {
                    bloodSugarReadings.saveData(bloodSugarReading: bloodSugarReading)
                    bloodSugarReading.date = ""
                    bloodSugarReading.time = ""
                    bloodSugarReading.bloodSugarLevel = ""
                    bloodSugarReading.meds = ""
                    bloodSugarReading.carbs = ""
                    bloodSugarReading.notes = ""
                    bloodSugarReading.userId = ""
                }
            label: {
                Label("Save", systemImage: "square.and.pencil").font(.system(size: 18))
                }
            }
        }
    }
}

//#Preview {
    //EditBloodSugarReadingView()
//}
