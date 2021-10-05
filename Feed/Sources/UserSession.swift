//
//  UserSession.swift
//  Feed
//
//  Created by Rayana Prata Neves on 02/10/21.
//

import Foundation

class UserSession {
    
    static let shared = UserSession()
    
    var name: String? {
        get {
            UserDefaults.standard.string(forKey: "keyName")
        } set {
            UserDefaults.standard.setValue(newValue, forKey: "keyName")
        }
    }
    var email: String?
    
    func logout() {
        name = nil
        email = nil
        FirebaseAuthManager.logout()
    }
    
}
