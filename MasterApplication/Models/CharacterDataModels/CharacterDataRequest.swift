//
//  CharacterDataRequest.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 23.10.2021.
//

import Foundation

class CharacterDataRequest: Codable {
    
    private(set) public var characterId: Int?
    private(set) public var offset: Int = 0
    private(set) public var limit: Int = 30
    private(set) public var ts: String
    private(set) public var apikey: String
    private(set) public var hash: String

    public init(characterId: Int? = nil,
                offset: Int = 0,
                limit: Int = 30,
                ts: String,
                apikey: String,
                hash: String) {
        
        self.characterId = characterId
        self.offset = offset
        self.limit = limit
        self.ts = ts
        self.apikey = apikey
        self.hash = hash
    }
    
}
