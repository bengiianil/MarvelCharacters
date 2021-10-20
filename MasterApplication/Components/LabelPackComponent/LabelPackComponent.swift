//
//  LabelPackComponent.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import Foundation
import UIKit

class LabelPackComponent: GenericBaseView<LabelPackComponentData> {
    
    private lazy var mainStackView: UIStackView = {
        
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private lazy var titleLabel: UILabel = {
        
        let title = UILabel()
        title.translatesAutoresizingMaskIntoConstraints = false
        title.textColor = .black
        title.text = " "
        title.lineBreakMode = .byWordWrapping
        title.numberOfLines = 0
        title.contentMode = .center
        title.textAlignment = .center
        title.font = FontManager.bold(24).value
        return title
    }()
    
    private lazy var subtitleLabel: UILabel = {
        
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textColor = .black
        subtitle.text = " "
        subtitle.lineBreakMode = .byWordWrapping
        subtitle.numberOfLines = 0
        subtitle.contentMode = .center
        subtitle.textAlignment = .center
        subtitle.font = FontManager.regular(18).value
        return subtitle
    }()
    
    override func setupViewConfigurations() {
        super.setupViewConfigurations()
        setMainStackView()
        setupTitleConfigurations()
        setupSubtitleConfigurations()
    }
    
    override func addMajorViewComponents() {
        super.addMajorViewComponents()
        addUserComponents()
    }
    
    func addUserComponents() {
        
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }
    
    // To load the data
    override func loadDataView() {
        
        super.loadDataView()
        
        // If there is no data, because its optional
        guard let data = returnData() else{ return }
        
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
    }
    
    private func setMainStackView() {
        guard let data = returnData() else { return }

        mainStackView.alignment = data.stackViewAlignment
        mainStackView.spacing = data.spacing
    }
    
    private func setupTitleConfigurations() {
        guard let data = returnData() else { return }
        
        titleLabel.lineBreakMode = data.titleLabelDistributionData.lineBreakMode
        titleLabel.numberOfLines = data.titleLabelDistributionData.numberOfLines
        titleLabel.contentMode = data.titleLabelDistributionData.contentMode
        titleLabel.textAlignment = data.titleLabelDistributionData.textAlignment
    }
    
    private func setupSubtitleConfigurations() {
        guard let data = returnData() else { return }
        
        subtitleLabel.lineBreakMode = data.subtitleLabelDistributionData.lineBreakMode
        subtitleLabel.numberOfLines = data.subtitleLabelDistributionData.numberOfLines
        subtitleLabel.contentMode = data.subtitleLabelDistributionData.contentMode
        subtitleLabel.textAlignment = data.subtitleLabelDistributionData.textAlignment
    }
}
