//
//  LoginViewBuilder.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import UIKit

class LoginViewBuilder {
    
    class func build() -> UIViewController {
        
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        return viewController
    }
}
