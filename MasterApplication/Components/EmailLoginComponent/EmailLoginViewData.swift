//
//  EmailLoginViewData.swift
//  MasterApplication
//
//  Created by Bengi on 21.10.2021.
//

import Foundation

class EmailLoginViewData {
  
    private(set) var emailData: TextFieldViewData
    private(set) var passwordData: TextFieldViewData
    
    init(emailData: TextFieldViewData, passwordData: TextFieldViewData) {
        self.emailData = emailData
        self.passwordData = passwordData
    }
}
