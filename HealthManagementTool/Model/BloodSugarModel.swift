//
//  BloodSugarModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import Foundation
import FirebaseFirestoreSwift

struct BloodSugarModel : Codable, Identifiable {
    @DocumentID var id: String?
    var date: String
    var time: String
    var bloodSugarLevel: String
    var meds: String
    var carbs: String
    var notes: String
    var userId: String
}
