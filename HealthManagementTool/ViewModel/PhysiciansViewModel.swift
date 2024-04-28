//
//  PhysiciansViewModel.swift
//  HealthManagementTool
//
//  Created by Blaire Grant on 4/27/24.
//

import Foundation
import Firebase
import FirebaseCore
import FirebaseFirestore

class PhysicianViewModel : ObservableObject {
    
    @Published var physicians = [PhysicianModel]()
    let db = Firestore.firestore()
    private var currentUserId: String = Auth.auth().currentUser?.uid ?? ""
        
    func fetchData() {
        self.physicians.removeAll()
        db.collection("physicians")
            .whereField("userId", isEqualTo: currentUserId)
            //.order(by: "lastName")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting physicians: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.physicians.append(try document.data(as: PhysicianModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
            }
        
    }
    
    func saveData(physician: PhysicianModel) {
        print(currentUserId)
        if !currentUserId.isEmpty {
            // Edit physician
            if let id = physician.id {
                if !physician.firstName.isEmpty || !physician.lastName.isEmpty {
                    let docRef = db.collection("physicians").document(id)
                    docRef.updateData([
                        "firstName": physician.firstName,
                        "lastName": physician.lastName,
                        "streetAddress": physician.streetAddress,
                        "city": physician.city,
                        "state": physician.state,
                        "postalCode": physician.postalCode,
                        "phoneNumber": physician.phoneNumber,
                        "faxNumber": physician.faxNumber,
                        "email": physician.email,
                        "url": physician.url,
                        "notes": physician.notes,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error updating physician: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error updating physician: \(err.localizedDescription)"
                            } else {
                                print("Physician successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Physician successfully updated"
//                            }
                        }
                    }
                }
            } else {
                // Add physician
                if !physician.firstName.isEmpty || !physician.lastName.isEmpty {
                    var ref: DocumentReference? = nil
                    ref = db.collection("physicians").addDocument(data: [
                        "firstName": physician.firstName,
                        "lastName": physician.lastName,
                        "streetAddress": physician.streetAddress,
                        "city": physician.city,
                        "state": physician.state,
                        "postalCode": physician.postalCode,
                        "phoneNumber": physician.phoneNumber,
                        "faxNumber": physician.faxNumber,
                        "email": physician.email,
                        "url": physician.url,
                        "notes": physician.notes,
                        "userId": currentUserId
                    ]) { err in
                        if let err = err {
                            print("Error adding physician: \(err)")
//                            if err != nil {
//                                self.showAlert = true
//                                self.userMessage = "Error adding physician: \(err.localizedDescription)"
                            } else {
                                print("Physician successfully updated")
//                                self.showAlert = true
//                                self.userMessage = "Physician added successfully"
//                            }
                        }
                    }
                }
            }
        }
        
    }
    
    func deleteData(physician: PhysicianModel) {
        if let documentId = physician.id {
            db.collection("physicians").document(documentId).delete { err in
                if let err = err {
                    print("Error deleting physician: \(err)")
//                    if err != nil {
//                        self.showAlert = true
//                        self.userMessage = "Error deleting physician: \(err.localizedDescription)"
                    } else {
                        print("Physician deleted successfully")
//                        self.showAlert = true
//                        self.userMessage = "Physician deleted successfully"
//                    }
                }
            }
        }
    }
}
