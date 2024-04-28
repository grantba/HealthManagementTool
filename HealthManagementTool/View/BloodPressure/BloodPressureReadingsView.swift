//
//  AddPhysicianView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/20/24.
//

import SwiftUI

struct BloodPressureReadingsView: View {
    @ObservedObject var bloodPressureReadings = BloodPressureViewModel()
    @State var bloodPressureReading = BloodPressureModel(date: "", time: "", systolic: "", diastolic: "", pulse: "", notes: "", userId: "")
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("Blood Pressure Log") {
                    ForEach($bloodPressureReadings.bloodPressureReadings) { $bloodPressureReading in
                        NavigationLink {
                            BloodPressureReadingDetails(bloodPressureReading: $bloodPressureReading)
                        }
                    label: {
                        Text("\(bloodPressureReading.date) at \(bloodPressureReading.time): \n\(bloodPressureReading.systolic)/\(bloodPressureReading.diastolic)")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            //.underline()
                    }
                        NavigationLink {
                            EditBloodPressureReadingView(bloodPressureReading: $bloodPressureReading)
                        }
                    label: {
                        Label("Edit", systemImage: "square.and.pencil")
                    }
                    .font(.system(size: 16, weight: .regular))
                    .padding([.leading], 30)
                    }
                }
                .foregroundColor(.blue)
                .font(.system(size: 20, weight: .semibold))
            }
            NavigationLink(destination: NewBloodPressureReadingView(bloodPressureReading: $bloodPressureReading)) {
                Button {
                // add blood pressure reading
                } label: {
                    Label("Add Blood Pressure Reading", systemImage: "plus").font(.system(size: 18))
                }
            }
        }
        .onAppear {
            bloodPressureReadings.fetchData()
        }
        .refreshable {
            bloodPressureReadings.fetchData()
        }
    }
}

//#Preview {
    //BloodPressureReadingsView()
//}
