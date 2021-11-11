//
//  CharacterDetailServiceProvider.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 24.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage
import SwiftUI

class CharacterDetailServiceProvider: ApiServiceProvider<CharacterDetailRequest> {
    
    init(request: CharacterDetailRequest) {
        super.init(method: .get,
                   baseUrl: BaseUrl.dev.rawValue,
                   path: Paths.detail(request.characterId ?? 0).value,
                   data: request)
    }
    
}
