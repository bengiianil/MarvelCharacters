//
//  LoginViewModel.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import Foundation

class LoginViewModel {
    
    private var authenticationManager: AuthenticationManagerProtocol
    init(authenticationManager: AuthenticationManagerProtocol) {
        self.authenticationManager = authenticationManager
    }
    
    func getLoginViewData() -> LoginAuthenticationViewData {
        return LoginAuthenticationViewData(emailLoginViewData: EmailLoginViewData(emailData: TextFieldViewData(placeHolder: "E-mail"), passwordData: TextFieldViewData(placeHolder: "Password")), loginButtonData: ActionButtonData(buttonText: "Sign In", buttonType:.filled(ActionButtonTheme.loginAction)).setActionButtonListener(by: signInActionButtonListener), signOutButtonData: ActionButtonData(buttonText: "Sign Out", buttonType:.outlined(ActionButtonTheme.bright)).setActionButtonListener(by: signOutActionButtonListener))
    }
    
    private func fireSignIn() {
        authenticationManager.signIn(with: AuthenticationRequest(email: "bengiianil@hotmail.com", password: "123123"))
    }
    
    private func fireSignOut() {
        authenticationManager.signOut()
    }
    
    private lazy var signInActionButtonListener: VoidCompletionBlock = { [weak self] in
        print("SignIn button tapped")
        self?.fireSignIn()
    }
    
    private lazy var signOutActionButtonListener: VoidCompletionBlock = { [weak self] in
        print("SignOut button tapped")
        self?.fireSignOut()
    }
}
