//
//  MedicationViewModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/21/24.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore

class MedicationViewModel : ObservableObject {
    
    @Published var medications = [MedicationModel]()
    let db = Firestore.firestore()
    private var currentUserId: String = Auth.auth().currentUser?.uid ?? ""
        
    func fetchData() {
        self.medications.removeAll()
        db.collection("medications")
            .whereField("userId", isEqualTo: currentUserId)
            //.order(by: "name")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting medications: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.medications.append(try document.data(as: MedicationModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        
    }
    
    func saveData(medication: MedicationModel) {
        print(currentUserId)
        if !currentUserId.isEmpty {
            // Edit medication
            if let id = medication.id {
                if !medication.name.isEmpty {
                    let docRef = db.collection("medications").document(id)
                    docRef.updateData([
                        "category": medication.category,
                        "dose": medication.dose,
                        "endDate": medication.endDate,
                        "expirationDate": medication.expirationDate,
                        "name": medication.name,
                        "notes": medication.notes,
                        "prescribingPhysician": medication.prescribingPhysician,
                        "prescriptionNumber": medication.prescriptionNumber,
                        "refillDate": medication.refillDate,
                        "route": medication.route,
                        "startDate": medication.startDate,
                        "time": medication.time,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error updating medication: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error updating medication: \(err.localizedDescription)"
                            } else {
                                print("Medication successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Medication successfully updated"
//                            }
                        }
                    }
                }
            } else {
                // Add medication
                if !medication.name.isEmpty {
                    var ref: DocumentReference? = nil
                    ref = db.collection("medications").addDocument(data: [
                        "category": medication.category,
                        "dose": medication.dose,
                        "endDate": medication.endDate,
                        "expirationDate": medication.expirationDate,
                        "name": medication.name,
                        "notes": medication.notes,
                        "prescribingPhysician": medication.prescribingPhysician,
                        "prescriptionNumber": medication.prescriptionNumber,
                        "refillDate": medication.refillDate,
                        "route": medication.route,
                        "startDate": medication.startDate,
                        "time": medication.time,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error adding medication: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error adding medication: \(err.localizedDescription)"
                            } else {
                                print("Medication successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Medication added successfully"
//                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func deleteData(medication: MedicationModel) {
        if let documentId = medication.id {
            db.collection("medications").document(documentId).delete { err in
                if let err = err {
                    print("Error deleting medication: \(err)")
//                    if err != nil {
//                        self.showAlert = true
//                        self.userMessage = "Error deleting medication: \(err.localizedDescription)"
                    } else {
                        print("Medication deleted successfully")
//                        self.showAlert = true
//                        self.userMessage = "Medication deleted successfully"
//                    }
                }
            }
        }
    }
}
