//
//  CustomTableViewProtocol.swift
//  GameOfThronesCharacters
//
//  Created by Bengi on 14.10.2021.
//

import Foundation
import UIKit

protocol CustomTableViewProtocol: AnyObject {
    
    func getNumberOfSection() -> Int
    func getNumberOfItem(in section: Int) -> Int
    func getData(at index: Int) -> GenericDataProtocol?
}
