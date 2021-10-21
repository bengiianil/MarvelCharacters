//
//  AccountViewModel.swift
//  MasterApplication
//
//  Created by Bengi on 20.10.2021.
//

import Foundation

typealias AccountViewStates = (ViewStates) -> Void

class AccountViewModel {
        
    private let formatter: AccountViewDataFormatterProtocol
    private var loginActionBlock: VoidCompletionBlock?
    private var state: AccountViewStates?
    private var data = [GenericDataProtocol]()
    
    init(formatter: AccountViewDataFormatterProtocol) {
        self.formatter = formatter
    }
    
    func getViewComponentData() {
        state?(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) { [weak self] in
            guard let self = self else { return }
            self.data = self.formatter.getAccountViewComponentData()
            self.state?(.done)
        }
    }
    
    func subscribeViewStates(with completion: @escaping AccountViewStates) {
        state = completion
    }
    
    func subscribeLoginActions(with completion: @escaping VoidCompletionBlock) {
        loginActionBlock = completion
    }
    
    func getTableViewData() -> CustomTableViewData? {
        return CustomTableViewData(headerViewData: formatter.getAccountHeaderViewData(with: loginActionButtonListener))
    }
    
    /// data binding
    private lazy var loginActionButtonListener: VoidCompletionBlock = { [weak self] in
        print("Login button tapped")
        self?.loginActionBlock?()
    }
}

extension AccountViewModel: CustomTableViewProtocol {
    
    func getNumberOfSection() -> Int {
        return 1
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return data.count
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return data[index]
    }
    
    /**
     func getHeaderViewData() -> HeaderViewData? {
         return formatter.getAccountHeaderViewData()
     }
     */
}
