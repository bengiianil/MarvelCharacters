//
//  CustomTableViewCellData.swift
//  GameOfThronesCharacters
//
//  Created by Bengi on 14.10.2021.
//

import Foundation
import UIKit

class CustomTableViewCellData: GenericDataProtocol {
    
    var type: GenericRowType? {
        return cellAction
    }
    
    private(set) var labelInfo: LabelPackComponentData
    private(set) var iconInfo: UIImage
    private let cellAction: GenericRowType

    init(labelInfo: LabelPackComponentData, iconInfo: UIImage, cellAction: GenericRowType) {
        self.labelInfo = labelInfo
        self.iconInfo = iconInfo
        self.cellAction = cellAction
    }
}
