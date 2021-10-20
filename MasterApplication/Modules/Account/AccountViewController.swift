//
//  AccountViewController.swift
//  MasterApplication
//
//  Created by Bengi on 20.10.2021.
//

import UIKit

class AccountViewController: BaseViewController<AccountViewModel> {

    private var mainComponent: CustomTableView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .yellow
        addMainComponent()
        subscribeViewModelPublishers()
        viewModel.getViewComponentData()
    }
    
    private func addMainComponent() {
        
        mainComponent = CustomTableView(data: viewModel.getTableViewData())
        mainComponent.translatesAutoresizingMaskIntoConstraints = false
        mainComponent.delegate = viewModel
        
        view.addSubview(mainComponent)
        
        NSLayoutConstraint.activate([
            mainComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func subscribeViewModelPublishers() {
        
        viewModel.subscribeViewStates { [weak self] state in
            switch state {
            case .loading:
                break
            case .done:
                self?.mainComponent.reloadTableView()
            default:
                break
            }
        }
        
        viewModel.subscribeLoginActions { [weak self] in
            self?.userLoginStateHandler()
        }
    }
    private func userLoginStateHandler() {
        present(LoginViewBuilder.build(), animated: true, completion: nil)
    }
}
