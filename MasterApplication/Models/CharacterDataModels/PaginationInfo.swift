//
//  PaginationInfo.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 23.10.2021.
//

import Foundation

struct PaginationInfo {
    var resultCount: Int = 0
    var limit: Int = 30
    var offset: Int = 0
    var fetching: Bool = false
    
    func checkLoadingMore() -> Bool {
        return limit <= resultCount && !fetching
    }
    
    mutating func nextOffset() {
        fetching = true
        offset += limit
    }
}
