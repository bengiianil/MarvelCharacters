//
//  TextFieldView.swift
//  MasterApplication
//
//  Created by Bengi on 21.10.2021.
//

import UIKit

class TextFieldView: GenericBaseView<TextFieldViewData> {
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var textFieldComponent: UITextField = {
        let view = UITextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clearButtonMode = .whileEditing
        return view
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addTextFieldComponents()
    }
    
    func addTextFieldComponents() {
        addSubview(containerView)
        containerView.addSubview(textFieldComponent)
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 60),

            textFieldComponent.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 10),
            textFieldComponent.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -10),
            textFieldComponent.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 2),
            textFieldComponent.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -2),
        ])
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        textFieldComponent.placeholder = data.placeHolder
    }
}
