//
//  FirebaseAuthManager.swift
//  Feed
//
//  Created by Rayana Prata Neves on 02/10/21.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class FirebaseAuthManager {
    
    // MARK: Properties
    
    //MARK: Methods
    static func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                completion(error)
            }
            else {
                guard let userId = authResult?.user.uid else {return}
                
                let db = Firestore.firestore()
                db.collection("users").document(userId).getDocument() { (document, err) in
                    if let err = err {
                        completion(err)
                    } else {
                        let dict = document?.data()
                        UserSession.shared.name = dict?["name"] as? String
                        UserSession.shared.email = dict?["email"] as? String
                        completion(nil)
                    }
                }
            }
        }
    }
    
    static func createAccount(name: String, email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if error != nil {
                completion(error)
            } else {                
                guard let userId = authResult?.user.uid else {return}
                
                let db = Firestore.firestore()
                db.collection("users").document(userId).setData([
                    "name": name,
                    "email": email
                ]) { err in
                    if let err = err {
                        completion(err)
                    } else {
                        completion(nil)
                    }
                }
            }
        }
    }
    
    static func logout() {
        try? Auth.auth().signOut()
    }
    
}
