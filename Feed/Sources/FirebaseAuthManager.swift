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
    static func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if error != nil {
                print("Erro: \(error?.localizedDescription)")
            } else {
                print("Usuario logado \(authResult?.user.uid)")
                
                guard let userId = authResult?.user.uid else {return}
                
                let db = Firestore.firestore()
                db.collection("users").document(userId).getDocument() { (document, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        print("Usuario: \(document?.data())")
                    }
                }
            }
        }
    }
    
}
