//
//  BloodPressureModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import Foundation
import FirebaseFirestoreSwift

struct BloodPressureModel : Codable, Identifiable {
    @DocumentID var id: String?
    var date: String
    var time: String
    var systolic: String
    var diastolic: String
    var pulse: String
    var notes: String
    var userId: String
}
