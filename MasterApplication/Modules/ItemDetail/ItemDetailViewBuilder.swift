//
//  ItemDetailViewBuilder.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 24.10.2021.
//

import Foundation
import UIKit

class ItemDetailViewBuilder {
    
    class func build(with data: ItemDetailViewRequest) -> UIViewController {
        let formatter = ItemDetailDataFormatter()
        let viewModel = ItemDetailViewModel(data: data, accessProviderManager: AccessProviderManager.shared, formatter: formatter)
        return ItemDetailViewController(viewModel: viewModel)
    }
    
}


