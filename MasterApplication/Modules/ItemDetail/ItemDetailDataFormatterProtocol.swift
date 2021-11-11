//
//  ItemDetailDataFormatterProtocol.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 24.10.2021.
//

import Foundation

protocol ItemDetailDataFormatterProtocol {
    
    func convertItemDetailView(from rawData: CharacterData) -> ItemDetailViewData
    
}

