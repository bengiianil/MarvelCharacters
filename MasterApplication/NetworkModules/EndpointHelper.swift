//
//  EndpointHelper.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 16.10.2021.
//

import Foundation

typealias BaseUrl = EndpointHelper.BaseUrls
typealias Paths = EndpointHelper.Paths

enum EndpointHelper {

    enum BaseUrls: String {
        case dev = "https://gateway.marvel.com:443/v1/public/"
    }

    enum Paths: GenericValueProtocol {

        typealias Value = String
        
        var value: String {
            switch self {
            case .characters:
                return "characters"
            case .detail(let characterId):
                return "characters/\(characterId)"
            }
        }
        
        case characters
        case detail(Int)
    }
    
}
