//
//  CharacterListServiceProvider.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 23.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class CharacterListServiceProvider: ApiServiceProvider<CharacterDataRequest> {
    
    init(request: CharacterDataRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.dev.rawValue,
                   path: Paths.characters.value,
                   data: request)
    }
    
}
