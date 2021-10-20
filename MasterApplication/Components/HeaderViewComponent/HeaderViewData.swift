//
//  HeaderViewData.swift
//  MasterApplication
//
//  Created by Bengi on 20.10.2021.
//

import Foundation

class HeaderViewData {
    
    private(set) var headerInfoData: LabelPackComponentData
    private(set) var loginButtonData: ActionButtonData

    init(headerInfoData: LabelPackComponentData, loginButtonData: ActionButtonData) {
        self.headerInfoData = headerInfoData
        self.loginButtonData = loginButtonData
    }
}
