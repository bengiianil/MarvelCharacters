//
//  SplashViewBuilder.swift
//  MasterApplication
//
//  Created by Bengi on 17.10.2021.
//

import Foundation
import UIKit

class SplashViewBuilder {
    
    class func build(with completion: @escaping VoidCompletionBlock) -> UIViewController {
        let viewModel = SplashViewModel(completion: completion)
        let viewController = SplashViewController(viewModel: viewModel)
        return viewController
    }
}
