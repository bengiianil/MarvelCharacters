//
//  AuthenticationManager.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import Foundation
import FirebaseAuth

class AuthenticationManager: AuthenticationManagerProtocol {
    
    public static let shared = AuthenticationManager()
    
    private init() { }
    
    func isLoggedIn(with completion: @escaping BooleanCompletionBlock) {
        Auth.auth().addStateDidChangeListener { auth, user in
            
            completion((user != nil) ? true : false)
            /**
             if user == nil {
                 // user logged out
             } else {
                 // user logged in
             }
             */
        }
    }
}
