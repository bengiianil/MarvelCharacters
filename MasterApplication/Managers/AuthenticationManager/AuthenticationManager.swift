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
            
            print("Logged In: \((user != nil) ? true : false)")
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
    
    func signIn(with request: AuthenticationRequest) {
        
        Auth.auth().signIn(withEmail: request.email, password: request.password) { authDataResult, error in
            if error != nil {
                print("error: \(error)")
            }
           // print("authDataResult: \(authDataResult)")
            print("break")
        }
        
     /* Auth.auth().createUser(withEmail: request.email, password: request.password) { data, error in
            
        } */
    }
    
    func signOut() {
        try? Auth.auth().signOut()
    }
}
