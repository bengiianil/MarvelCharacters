//
//  AccountViewBuilder.swift
//  MasterApplication
//
//  Created by Bengi on 20.10.2021.
//

import UIKit

class AccountViewBuilder {
    
    class func build() -> UIViewController {
        
        let formatter = AccountViewDataFormatter()
        let authenticationManager = AuthenticationManager.shared
        let viewModel = AccountViewModel(formatter: formatter, authenticationManager: authenticationManager)
        let viewController = AccountViewController(viewModel: viewModel)
        viewController.tabBarItem.image = TabBarImages.account.value
        viewController.tabBarItem.selectedImage = TabBarImages.accountSelected.value
        return viewController
    }
}
