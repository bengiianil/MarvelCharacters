//
//  MainViewController.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import Foundation
import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    
    private var mainComponent: ItemCollectionView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        view.backgroundColor = .systemOrange
        addMainComponent()
        addViewModelListeners()
    }
    
    private func addMainComponent() {
        mainComponent = ItemCollectionView()
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
 
    private func addViewModelListeners() {
        viewModel.subscribeViewState { [weak self] state in
            switch state {
            case .loading:
                return
            case .done:
                self?.mainComponent.reloadCollectionView()
            default:
                break
            }
        }
        
        viewModel.subscribeDetailViewState { [weak self] data in
            self?.fireDetailView(with: data)
        }
    }
    
    private func fireDetailView(with data: ItemDetailViewRequest) {
        
        let viewController = ItemDetailViewBuilder.build(with: data)
        
        switch data.type {
        case .push:
            navigationController?.pushViewController(viewController, animated: true)
        case .present:
            present(viewController, animated: true, completion: nil)
        }
        
    }
    
}

