//
//  MainViewController.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import Foundation
import UIKit

fileprivate extension Selector {
    static var buttonTapped = #selector(MainViewController.buttonAction)
}

class MainViewController: BaseViewController<MainViewModel> {
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: .buttonTapped, for: .touchUpInside)
        button.setTitle("PUSH", for: .normal)
        button.tintColor = .white
        return button
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .systemOrange
        addButton()
        addViewModelListeners()
    }
    
    private func addButton() {
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    private func addViewModelListeners() {
        // start to listen viewModel
        viewModel.subscribeLoginStates { [weak self] state in
            
            // take action according to the listened viewModel, call userLoginStateHandler()
            self?.userLoginStateHandler(with: state)
        }
        
    }
    
    private func userLoginStateHandler(with value: Bool) {
        guard !value else { return }
        // present(LoginViewBuilder.build(), animated: true, completion: nil)

        /** same with guard statement
         if user == nil {
             // user logged out
         } else {
             // user logged in
         }
         */
    }
    
    @objc func buttonAction(_ sender: UIButton) {
        print("Action button tapped.")
    }
}

