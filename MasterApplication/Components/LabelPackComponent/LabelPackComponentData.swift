//
//  LabelPackComponentData.swift
//  AppPermissions
//
//  Created by Bengi on 30.09.2021.
//

import UIKit

class LabelPackComponentData {
    
    private(set) var title: String
    private(set) var subtitle: String
    private(set) var stackViewAlignment: UIStackView.Alignment = .center
    private(set) var spacing: CGFloat = 10
    private(set) var titleLabelDistributionData: LabelPackDistributionData = LabelPackDistributionData()
    private(set) var subtitleLabelDistributionData: LabelPackDistributionData = LabelPackDistributionData()

    init(title: String = "", subtitle: String = "") {
        self.title = title
        self.subtitle = subtitle
    }
    
    func setStackViewAlignment(by value: UIStackView.Alignment) -> Self {
        stackViewAlignment = value
        return self
    }
    
    func setSpacing(by value: CGFloat) -> Self {
        spacing = value
        return self
    }
    
    func setTitleLabelDistributionData(by value: LabelPackDistributionData) -> Self {
        titleLabelDistributionData = value
        return self
    }
    
    func setSubtitleLabelDistributionData(by value: LabelPackDistributionData) -> Self {
        subtitleLabelDistributionData = value
        return self
    }
}
