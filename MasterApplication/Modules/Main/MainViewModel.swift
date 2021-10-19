//
//  MainViewModel.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import Foundation

class MainViewModel {
    
    private var loginStateListener: BooleanCompletionBlock?
    
    private let authenticationManager: AuthenticationManagerProtocol
    
    init(authenticationManager: AuthenticationManagerProtocol) {
        self.authenticationManager = authenticationManager
        listenUserState()
    }
    
    private func listenUserState() {
        authenticationManager.isLoggedIn { [weak self] state in
            print("User State: \(state)")
            
            DispatchQueue.main.asyncAfter(deadline: .now()+1) {
                
                // to inform the login state listener
                self?.loginStateListener?(state)
            }
        }
    }
    
    func subscribeLoginStates(with completion: @escaping BooleanCompletionBlock) {
        loginStateListener = completion
    }
}
