//
//  LoginAuthenticationViewData.swift
//  MasterApplication
//
//  Created by Bengi on 21.10.2021.
//

import Foundation
import UIKit

class LoginAuthenticationViewData {

    private(set) var emailLoginViewData: EmailLoginViewData
    private(set) var loginButtonData: ActionButtonData
    private(set) var signOutButtonData: ActionButtonData

    init(emailLoginViewData: EmailLoginViewData, loginButtonData: ActionButtonData, signOutButtonData: ActionButtonData) {
        self.emailLoginViewData = emailLoginViewData
        self.loginButtonData = loginButtonData
        self.signOutButtonData = signOutButtonData
    }
}
