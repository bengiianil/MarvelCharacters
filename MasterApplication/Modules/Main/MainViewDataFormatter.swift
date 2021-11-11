//
//  MainViewDataFormatter.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 23.10.2021.
//

import Foundation

class MainViewDataFormatter: MainViewDataFormatterProtocol {
    
    private var componentData: CharacterListData?
    private var list: [CharacterData] = [CharacterData]()

    var paginationData: PaginationInfo = PaginationInfo()
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumbeOfItem(in section: Int) -> Int {
        let count = list.count
        return (paginationData.limit <= paginationData.resultCount) ? count + 1 : count
    }
    
    func getCount() -> Int {
        return list.count
    }
    
    func setData(with response: CharacterDataResponse) {
        self.componentData = response.data
        self.paginationData.resultCount = response.data.count
        self.list.append(contentsOf: response.data.results)
    }
    
    func getItem(at index: Int) -> GenericDataProtocol? {
        return ContentDisplayerViewData(imageData: CustomImageViewComponentData(imageUrl: createImageData(by: list[index].thumbnail)), name: list[index].name)
    }
    
    func getItemId(at index: Int) -> Int {
        return list[index].id
    }
    
    private func createImageData(by value: Thumbnail) -> String {
        return "\(value.path)/portrait_incredible.\(value.thumbnailExtension)"
    }
    
}
