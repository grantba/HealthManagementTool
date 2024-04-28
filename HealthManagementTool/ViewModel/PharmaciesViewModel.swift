//
//  PharmaciesViewModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/27/24.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore

class PharmacyViewModel : ObservableObject {
    
    @Published var pharmacies = [PharmacyModel]()
    let db = Firestore.firestore()
    private var currentUserId: String = Auth.auth().currentUser?.uid ?? ""
        
    func fetchData() {
        self.pharmacies.removeAll()
        db.collection("pharmacies")
            .whereField("userId", isEqualTo: currentUserId)
            //.order(by: "name")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting pharmacies: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.pharmacies.append(try document.data(as: PharmacyModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        
    }
    
    func saveData(pharmacy: PharmacyModel) {
        print(currentUserId)
        if !currentUserId.isEmpty {
            // Edit pharmacy
            if let id = pharmacy.id {
                if !pharmacy.name.isEmpty {
                    let docRef = db.collection("pharmacies").document(id)
                    docRef.updateData([
                        "name": pharmacy.name,
                        "streetAddress": pharmacy.streetAddress,
                        "city": pharmacy.city,
                        "state": pharmacy.state,
                        "postalCode": pharmacy.postalCode,
                        "phoneNumber": pharmacy.phoneNumber,
                        "faxNumber": pharmacy.faxNumber,
                        "email": pharmacy.email,
                        "url": pharmacy.url,
                        "notes": pharmacy.notes,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error updating pharmacy: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error updating pharmacy: \(err.localizedDescription)"
                            } else {
                                print("Pharmacy successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Pharmacy successfully updated"
//                            }
                        }
                    }
                }
            } else {
                // Add pharmacy
                if !pharmacy.name.isEmpty {
                    var ref: DocumentReference? = nil
                    ref = db.collection("pharmacies").addDocument(data: [
                        "name": pharmacy.name,
                        "streetAddress": pharmacy.streetAddress,
                        "city": pharmacy.city,
                        "state": pharmacy.state,
                        "postalCode": pharmacy.postalCode,
                        "phoneNumber": pharmacy.phoneNumber,
                        "faxNumber": pharmacy.faxNumber,
                        "email": pharmacy.email,
                        "url": pharmacy.url,
                        "notes": pharmacy.notes,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error adding pharmacy: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error adding pharmacy: \(err.localizedDescription)"
                            } else {
                                print("Pharmacy successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Pharmacy added successfully"
//                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func deleteData(pharmacy: PharmacyModel) {
        if let documentId = pharmacy.id {
            db.collection("pharmacies").document(documentId).delete { err in
                if let err = err {
                    print("Error deleting pharmacy: \(err)")
//                    if err != nil {
//                        self.showAlert = true
//                        self.userMessage = "Error deleting pharmacy: \(err.localizedDescription)"
                    } else {
                        print("Pharmacy deleted successfully")
//                        self.showAlert = true
//                        self.userMessage = "Pharmacy deleted successfully"
//                    }
                }
            }
        }
    }
}
