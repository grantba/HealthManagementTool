//
//  PhysicianModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/27/24.
//

import Foundation
import FirebaseFirestoreSwift

struct PhysicianModel : Codable, Identifiable {
    @DocumentID var id: String?
    var firstName: String
    var lastName: String
    var streetAddress: String
    var city: String
    var state: String
    var postalCode: String
    var phoneNumber: String
    var faxNumber: String
    var email: String
    var url: String
    var notes: String
    var userId: String
}
