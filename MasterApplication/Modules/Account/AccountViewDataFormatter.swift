//
//  AccountRowDataBuilder.swift
//  MasterApplication
//
//  Created by Bengi on 20.10.2021.
//

import UIKit

class AccountViewDataFormatter: AccountViewDataFormatterProtocol {

    func getAccountViewComponentData() -> [GenericDataProtocol] {
        
        let settings = LabelPackComponentData(title: "Settings")
            .setTitleLabelDistributionData(by: LabelPackDistributionData()
                                            .setTextAlignment(by: .left)
                                            .setContentMode(by: .center)
                                            .setNumberOfLines(by: 1)
                )
        
        let help = LabelPackComponentData(title: "Help")
            .setTitleLabelDistributionData(by: LabelPackDistributionData()
                                            .setTextAlignment(by: .left)
                                            .setContentMode(by: .center)
                                            .setNumberOfLines(by: 1)
                )
        
        return [CustomTableViewCellData(labelInfo: settings, iconInfo: SFSymbolsHelper.gearShape.value!, cellAction: .settings),
                CustomTableViewCellData(labelInfo: help, iconInfo: SFSymbolsHelper.questionMark.value!, cellAction: .getHelp)]
    }
    
    func getAccountHeaderViewData(with completion: @escaping VoidCompletionBlock) -> HeaderViewData {
        return HeaderViewData(headerInfoData: LabelPackComponentData(title: "Your Profile",
                                                                 subtitle: "Login to start watching unlimited movies, and more."),
                            loginButtonData: ActionButtonData(buttonText: "Log In",
                                                              buttonType: ActionButtonType.filled(ActionButtonTheme.loginAction)).setActionButtonListener(by: completion))
    }
}
