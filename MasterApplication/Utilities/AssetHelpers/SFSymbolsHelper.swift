//
//  SFSymbolsHelper.swift
//  MasterApplication
//
//  Created by Bengi on 20.10.2021.
//

import UIKit

enum SFSymbolsHelper: String, GenericValueProtocol {
    
    typealias Value = UIImage?
    
    var value: UIImage? {
        return UIImage(systemName: rawValue)
    }
    
    case gearShape = "gearshape"
    case questionMark = "questionmark.circle"
}
