//
//  GenericBaseView.swift
//  AppPermissions
//
//  Created by Bengi on 29.09.2021.
//

import Foundation
import UIKit

class GenericBaseView<T>: BaseView {
    
    private var data: T?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    // In second init, we can assign, give the data here
    init(frame: CGRect = .zero, data: T? = nil) {
        
        self.data = data
        super.init(frame: frame)
        loadDataView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func loadDataView() {
        
    }
    
    func setData(by value: T?) {
        self.data = value
        loadDataView()
    }
    
    func returnData() -> T? {
        return data
    }
}
