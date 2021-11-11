//
//  ItemDetailViewData.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 24.10.2021.
//

import Foundation

class ItemDetailViewData {
    
    private(set) var imageData: CustomImageViewComponentData
    private(set) var labelPackData: LabelPackComponentData
    
    init(imageData: CustomImageViewComponentData,
         labelPackData: LabelPackComponentData) {
        self.imageData = imageData
        self.labelPackData = labelPackData
    }
    
}
