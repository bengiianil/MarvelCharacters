//
//  GenericValueProtocol.swift
//  AppPermissions
//
//  Created by Bengi on 28.09.2021.
//

import Foundation

protocol GenericValueProtocol {
    
    associatedtype Value
    var value: Value {
        get
    }
}
