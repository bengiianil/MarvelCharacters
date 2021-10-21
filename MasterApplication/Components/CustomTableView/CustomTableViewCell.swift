//
//  CustomTableViewCell.swift
//  GameOfThronesCharacters
//
//  Created by Bengi on 14.10.2021.
//

import Foundation
import UIKit

class CustomTableViewCell: BaseTableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var mainStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [labelComponent, iconComponent])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alignment = .center
        view.distribution = .fill
        view.axis = .horizontal
        view.spacing = 10
        return view
    }()
    
    private lazy var labelComponent: LabelPackComponent = {
        let view = LabelPackComponent(data: getLabelPackComponentData())
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var iconComponent: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.heightAnchor.constraint(equalToConstant: 24).isActive = true
        view.widthAnchor.constraint(equalToConstant: 24).isActive = true
        return view
    }()
    

    override func addMajorViews() {
        super.addMajorViews()
        addInfoComponents()
    }
    
    private func addInfoComponents() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 30),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -30),
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10),

        ])
    }
    
    func setData(by value: GenericDataProtocol) {
        guard let data = value as? CustomTableViewCellData else { return }
        labelComponent.setData(by: data.labelInfo)
        iconComponent.image = data.iconInfo
        iconComponent.image = data.iconInfo.withRenderingMode(.alwaysTemplate)
        iconComponent.tintColor = .black
    }
    
    private func getLabelPackComponentData() -> LabelPackComponentData {
        return LabelPackComponentData()
            .setSubtitleLabelDistributionData(by: LabelPackDistributionData()
                                                .setContentMode(by: .left)
                                                .setTextAlignment(by: .left)
                                                .setNumberOfLines(by: 2)
                                                .setLineBreakMode(by: .byTruncatingTail))
            .setTitleLabelDistributionData(by: LabelPackDistributionData()
                                            .setContentMode(by: .left)
                                            .setTextAlignment(by: .left)
                                            .setNumberOfLines(by: 1)
                                            .setLineBreakMode(by: .byTruncatingTail))
            .setSpacing(by: 5)
            .setStackViewAlignment(by: .fill)
    }
}
