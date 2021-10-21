//
//  LoginViewBuilder.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import UIKit

class LoginViewBuilder {
    
    class func build() -> UIViewController {
        
        let authenticationManager = AuthenticationManager.shared
        let viewModel = LoginViewModel(authenticationManager: authenticationManager)
        let viewController = LoginViewController(viewModel: viewModel)
        return viewController
    }
}
