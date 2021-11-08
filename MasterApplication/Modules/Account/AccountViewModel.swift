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
    private let authenticationManager: AuthenticationManagerProtocol
    
    private var loginActionBlock: VoidCompletionBlock?
    private var state: AccountViewStates?
    private var data = [GenericDataProtocol]()
    
    init(formatter: AccountViewDataFormatterProtocol, authenticationManager: AuthenticationManagerProtocol) {
        self.formatter = formatter
        self.authenticationManager = authenticationManager
        subscribeAuthenticationManager()
    }
    
    func getViewComponentData() {
       /* state?(.loading)
        DispatchQueue.main.asyncAfter(deadline: .now()+0.2) { [weak self] in
            guard let self = self else { return }
            self.data = self.formatter.getAccountViewComponentData()
            self.state?(.done)
        }*/
    }
    
    func getTableViewData() -> CustomTableViewData? {
        return CustomTableViewData(headerViewData: formatter.getAccountHeaderViewData(with: loginActionButtonListener))
    }
    
    func subscribeViewStates(with completion: @escaping AccountViewStates) {
        state = completion
    }
    
    func subscribeLoginActions(with completion: @escaping VoidCompletionBlock) {
        loginActionBlock = completion
    }

    // MARK: - Private Methods
    private func subscribeAuthenticationManager() {
        authenticationManager.isLoggedIn(with: isLoggedInListener)
    }
    
    private func loggedInListenerHandler(with value: Bool) {
        state?(.loading)
        data = formatter.getAccountViewComponentData(by: value)
        state?(.done)
    }
    
    private func selectedItemHandler(at index: Int) {
        switch data[index].type {
        case .logout:
            authenticationManager.signOut()
        default:
            break
        }
    }
    
    // MARK: - Listener Handler
    /// data binding
    private lazy var loginActionButtonListener: VoidCompletionBlock = { [weak self] in
        print("Login button tapped")
        self?.loginActionBlock?()
    }
    
    private lazy var isLoggedInListener: BooleanCompletionBlock = { [weak self] value in
        self?.loggedInListenerHandler(with: value)
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
    
    func selectedItem(at index: Int) {
        selectedItemHandler(at: index)
    }
}
