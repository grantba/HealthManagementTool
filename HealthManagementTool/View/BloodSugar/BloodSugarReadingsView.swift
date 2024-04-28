//
//  BloodSugarLogView.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/21/24.
//

import SwiftUI

struct BloodSugarReadingsView: View {
    @ObservedObject var bloodSugarReadings = BloodSugarViewModel()
    @State var bloodSugarReading = BloodSugarModel(date: "", time: "", bloodSugarLevel: "", meds: "", carbs: "", notes: "", userId: "")
    
    var body: some View {
        List {
            Section {
                DisclosureGroup("Blood Sugar Log") {
                    ForEach($bloodSugarReadings.bloodSugarReadings) { $bloodSugarReading in
                        NavigationLink {
                            BloodSugarReadingDetails(bloodSugarReading: $bloodSugarReading)
                        }
                    label: {
                        Text("\(bloodSugarReading.date) at \(bloodSugarReading.time): \n\(bloodSugarReading.bloodSugarLevel) mg/dL")
                            .font(.system(size: 18, weight: .semibold))
                            .foregroundColor(.blue)
                            //.underline()
                    }
                        NavigationLink {
                            EditBloodSugarReadingView(bloodSugarReading: $bloodSugarReading)
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
            NavigationLink(destination: NewBloodSugarReadingView(bloodSugarReading: $bloodSugarReading)) {
                Button {
                // add blood sugar reading
                } label: {
                    Label("Add Blood Sugar Reading", systemImage: "plus").font(.system(size: 18))
                }
            }
        }
        .onAppear {
            bloodSugarReadings.fetchData()
        }
        .refreshable {
            bloodSugarReadings.fetchData()
        }
    }
}

//#Preview {
    //BloodSugarReadingsView()
//}
