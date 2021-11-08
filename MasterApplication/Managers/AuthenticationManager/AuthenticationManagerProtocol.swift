//
//  AuthenticationManagerProtocol.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import Foundation

typealias BooleanCompletionBlock = (Bool) -> Void

protocol AuthenticationManagerProtocol {
    
    func isLoggedIn(with completion: @escaping BooleanCompletionBlock)
    func signIn(with request: AuthenticationRequest)
    func signOut()
}
