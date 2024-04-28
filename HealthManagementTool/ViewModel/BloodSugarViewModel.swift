//
//  BloodSugarViewModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore

class BloodSugarViewModel : ObservableObject {
    
    @Published var bloodSugarReadings = [BloodSugarModel]()
    let db = Firestore.firestore()
    private var currentUserId: String = Auth.auth().currentUser?.uid ?? ""
        
    func fetchData() {
        self.bloodSugarReadings.removeAll()
        db.collection("bloodSugarReadings")
            .whereField("userId", isEqualTo: currentUserId)
            //.order(by: "date")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting blood sugar readings: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.bloodSugarReadings.append(try document.data(as: BloodSugarModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        
    }
    
    func saveData(bloodSugarReading: BloodSugarModel) {
        print(currentUserId)
        if !currentUserId.isEmpty {
            // Edit blood sugar reading
            if let id = bloodSugarReading.id {
                if !bloodSugarReading.date.isEmpty && bloodSugarReading.time.isEmpty && bloodSugarReading.bloodSugarLevel.isEmpty {
                    let docRef = db.collection("bloodSugarReadings").document(id)
                    docRef.updateData([
                        "date": bloodSugarReading.date,
                        "time": bloodSugarReading.time,
                        "bloodSugarLevel": bloodSugarReading.bloodSugarLevel,
                        "meds": bloodSugarReading.meds,
                        "carbs": bloodSugarReading.carbs,
                        "notes": bloodSugarReading.notes,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error updating blood sugar reading: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error updating blood sugar reading: \(err.localizedDescription)"
                            } else {
                                print("Blood sugar reading successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Blood sugar reading successfully updated"
//                            }
                        }
                    }
                }
            } else {
                // Add blood sugar reading
                if !bloodSugarReading.date.isEmpty && bloodSugarReading.time.isEmpty && bloodSugarReading.bloodSugarLevel.isEmpty {
                    var ref: DocumentReference? = nil
                    ref = db.collection("bloodSugarReadings").addDocument(data: [
                        "date": bloodSugarReading.date,
                        "time": bloodSugarReading.time,
                        "bloodSugarLevel": bloodSugarReading.bloodSugarLevel,
                        "meds": bloodSugarReading.meds,
                        "carbs": bloodSugarReading.carbs,
                        "notes": bloodSugarReading.notes,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error adding blood sugar reading: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error adding blood sugar reading: \(err.localizedDescription)"
                            } else {
                                print("Blood sugar reading successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Blood sugar reading added successfully"
//                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func deleteData(bloodSugarReading: BloodSugarModel) {
        if let documentId = bloodSugarReading.id {
            db.collection("bloodSugarReadings").document(documentId).delete { err in
                if let err = err {
                    print("Error deleting blood sugar reading: \(err)")
//                    if err != nil {
//                        self.showAlert = true
//                        self.userMessage = "Error deleting blood sugar reading: \(err.localizedDescription)"
                    } else {
                        print("Blood sugar reading deleted successfully")
//                        self.showAlert = true
//                        self.userMessage = "Blood sugar reading deleted successfully"
//                    }
                }
            }
        }
    }
}
