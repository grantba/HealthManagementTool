//
//  MedicationModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/21/24.
//

import Foundation
import FirebaseFirestoreSwift

struct MedicationModel : Codable, Identifiable {
    @DocumentID var id: String?
    var category: String
    var dose: String
    var endDate: String
    var expirationDate: String
    var name: String
    var notes: String
    var prescribingPhysician: String
    var prescriptionNumber: String
    var refillDate: String
    var route: String
    var startDate: String
    var time: String
    var userId: String
}
