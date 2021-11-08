//
//  AccountViewDataFormatterProtocol.swift
//  MasterApplication
//
//  Created by Bengi on 20.10.2021.
//

import Foundation

protocol AccountViewDataFormatterProtocol {
    
    func getAccountViewComponentData(by loggedIn: Bool) -> [GenericDataProtocol]
    func getAccountHeaderViewData(with completion: @escaping VoidCompletionBlock) -> HeaderViewData
}
