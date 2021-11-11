//
//  CharacterDetailRequest.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 24.10.2021.
//

import Foundation

class CharacterDetailRequest: Codable {
    
    private(set) public var characterId: Int?
    private(set) public var ts: String
    private(set) public var apikey: String
    private(set) public var hash: String

    public init(characterId: Int? = nil,
                ts: String,
                apikey: String,
                hash: String) {
        
        self.characterId = characterId
        self.ts = ts
        self.apikey = apikey
        self.hash = hash
    }
    
}
