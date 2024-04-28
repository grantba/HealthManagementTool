//
//  BloodPressureViewModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/28/24.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore

class BloodPressureViewModel : ObservableObject {
    
    @Published var bloodPressureReadings = [BloodPressureModel]()
    let db = Firestore.firestore()
    private var currentUserId: String = Auth.auth().currentUser?.uid ?? ""
        
    func fetchData() {
        self.bloodPressureReadings.removeAll()
        db.collection("bloodPressureReadings")
            .whereField("userId", isEqualTo: currentUserId)
            //.order(by: "date")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting blood pressure readings: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.bloodPressureReadings.append(try document.data(as: BloodPressureModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        
    }
    
    func saveData(bloodPressureReading: BloodPressureModel) {
        print(currentUserId)
        if !currentUserId.isEmpty {
            // Edit blood pressure reading
            if let id = bloodPressureReading.id {
                if !bloodPressureReading.date.isEmpty && !bloodPressureReading.time.isEmpty && bloodPressureReading.systolic.isEmpty && !bloodPressureReading.diastolic.isEmpty {
                    let docRef = db.collection("bloodPressureReadings").document(id)
                    docRef.updateData([
                        "date": bloodPressureReading.date,
                        "time": bloodPressureReading.time,
                        "systolic": bloodPressureReading.systolic,
                        "diastolic": bloodPressureReading.diastolic,
                        "pulse": bloodPressureReading.pulse,
                        "notes": bloodPressureReading.notes,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error updating blood pressure reading: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error updating blood pressure reading: \(err.localizedDescription)"
                            } else {
                                print("Blood pressure reading successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Blood pressure reading successfully updated"
//                            }
                        }
                    }
                }
            } else {
                // Add blood pressure reading
                if !bloodPressureReading.date.isEmpty && !bloodPressureReading.time.isEmpty && bloodPressureReading.systolic.isEmpty && !bloodPressureReading.diastolic.isEmpty {
                    var ref: DocumentReference? = nil
                    ref = db.collection("bloodPressureReadings").addDocument(data: [
                        "date": bloodPressureReading.date,
                        "time": bloodPressureReading.time,
                        "systolic": bloodPressureReading.systolic,
                        "diastolic": bloodPressureReading.diastolic,
                        "pulse": bloodPressureReading.pulse,
                        "notes": bloodPressureReading.notes,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error adding blood pressure reading: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error adding blood pressure reading: \(err.localizedDescription)"
                            } else {
                                print("Blood pressure reading successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Blood pressure reading added successfully"
//                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func deleteData(bloodPressureReading: BloodPressureModel) {
        if let documentId = bloodPressureReading.id {
            db.collection("bloodPressureReadings").document(documentId).delete { err in
                if let err = err {
                    print("Error deleting blood pressure reading: \(err)")
//                    if err != nil {
//                        self.showAlert = true
//                        self.userMessage = "Error deleting blood pressure reading: \(err.localizedDescription)"
                    } else {
                        print("Blood pressure reading deleted successfully")
//                        self.showAlert = true
//                        self.userMessage = "Blood pressure reading deleted successfully"
//                    }
                }
            }
        }
    }
}
