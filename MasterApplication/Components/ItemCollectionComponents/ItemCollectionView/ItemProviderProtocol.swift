//
//  ItemProviderProtocol.swift
//  Week_3
//
//  Created by Erkut Bas on 2.10.2021.
//

import Foundation

protocol ItemProviderProtocol: AnyObject {
    
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
    func selectedItem(at index: Int)
    func getMoreData()
    func isLoadingCell(for index: Int) -> Bool
}

extension ItemProviderProtocol {
    func selectedItem(at index: Int) { }
    func getMoreData() { }
    func isLoadingCell(for index: Int) -> Bool { return false }
}

