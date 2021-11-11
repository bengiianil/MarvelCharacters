//
//  MainViewDataFormatterProtocol.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 23.10.2021.
//

import Foundation

protocol MainViewDataFormatterProtocol {
    
    var paginationData: PaginationInfo { get set }
    
    func getNumberOfSection() -> Int
    
    func getNumbeOfItem(in section: Int) -> Int
    
    func getCount() -> Int
    
    func setData(with response: CharacterDataResponse)
    
    func getItem(at index: Int) -> GenericDataProtocol?
    
    func getItemId(at index: Int) -> Int
    
}

