//
//  HeaderView.swift
//  MasterApplication
//
//  Created by Bengi on 20.10.2021.
//

import UIKit

class HeaderView: GenericBaseView<HeaderViewData> {
    
    private var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.shadowOpacity = 0.2
        view.layer.cornerRadius = 8
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [headerInfo, loginButton])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 20
        return temp
    }()
    
    private lazy var headerInfo: LabelPackComponent = {
        let view = LabelPackComponent(data: getLabelPackComponentData())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var loginButton: ActionButton = {
        let view = ActionButton()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 50).isActive = true
        view.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60).isActive = true
        return view
    }()
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addHeaderViewComponents()
    }
    
    func addHeaderViewComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            mainStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor, constant: 20),
        ])
    }
    
    private func getLabelPackComponentData() -> LabelPackComponentData {
        return LabelPackComponentData()
            .setTitleLabelDistributionData(by: LabelPackDistributionData()
                                            .setContentMode(by: .left)
                                            .setTextAlignment(by: .left)
                                            .setNumberOfLines(by: 1)
                                            .setLineBreakMode(by: .byTruncatingTail)
                                            .setFont(by: MainFont.bold(20).value))
            .setSubtitleLabelDistributionData(by: LabelPackDistributionData()
                                                .setContentMode(by: .left)
                                                .setTextAlignment(by: .left)
                                                .setNumberOfLines(by: 2)
                                                .setLineBreakMode(by: .byTruncatingTail)
                                                .setFont(by: MainFont.regular(16).value))
            .setSpacing(by: 10)
            .setStackViewAlignment(by: .fill)
    }
    
    override func loadDataView() {
        super.loadDataView()
        guard let data = returnData() else { return }
        
        headerInfo.setData(by: data.headerInfoData)
        loginButton.setData(by: data.loginButtonData)
    }
}
