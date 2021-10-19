//
//  SplashViewController.swift
//  MasterApplication
//
//  Created by Bengi on 17.10.2021.
//

import Foundation
import UIKit

class SplashViewController: BaseViewController<SplashViewModel> {

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WEATHER FORECAST"
        label.textColor = .white
        label.font = MainFont.medium(30).value
        return label
    }()
    
    private lazy var imageComponent: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = false // when the user taps, nothing happens
        view.image = PageViewImages.splashBackground.value
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        addSplashViews()
        viewModel.fireApplicationInitiateProcess()
    }
    
    func addSplashViews() {
        view.addSubview(imageComponent)
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            imageComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imageComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            imageComponent.topAnchor.constraint(equalTo: view.topAnchor),
            imageComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -120),
        ])
    }

}
