//
//  LoginAuthenticationView.swift
//  MasterApplication
//
//  Created by Bengi on 21.10.2021.
//

import UIKit

class LoginAuthenticationView: GenericBaseView<LoginAuthenticationViewData> {
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emailLoginView, labelInfo, loginButton, signOutButton])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .fill
        view.distribution = .fill
        view.axis = .vertical
        return view
    }()
    
    private lazy var emailLoginView: EmailLoginView = {
        let view = EmailLoginView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelInfo: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.font = MainFont.regular(14).value
        view.text = "Please provide email and password to login the movie application successfully."
        view.numberOfLines = 0
        view.lineBreakMode = .byWordWrapping
        view.contentMode = .center
        view.textAlignment = .left
        return view
    }()
    
    private lazy var loginButton: ActionButton = {
        let view = ActionButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        return view
    }()
    
    private lazy var signOutButton: ActionButton = {
        let view = ActionButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        return view
    }()
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addEmailLoginComponents()
    }
    
    func addEmailLoginComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
                        
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 30),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -30),
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        emailLoginView.setData(by: data.emailLoginViewData)
        loginButton.setData(by: data.loginButtonData)
        signOutButton.setData(by: data.signOutButtonData)

        mainStackView.setCustomSpacing(20, after: emailLoginView)
        mainStackView.setCustomSpacing(30, after: labelInfo)
        mainStackView.setCustomSpacing(30, after: loginButton)

    }
}
