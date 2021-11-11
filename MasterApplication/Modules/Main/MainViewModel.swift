//
//  MainViewModel.swift
//  MasterApplication
//
//  Created by Bengi on 19.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class MainViewModel {
    
    private var loginStateListener: BooleanCompletionBlock?
    private var mainViewState: ((ViewStates) -> Void)?
    private var detailViewState: ItemDetailRequestBlock?
    
    private let authenticationManager: AuthenticationManager
    private let accessProviderManager: AccessProviderProtocol
    private var dataFormatter: MainViewDataFormatterProtocol
    
    init(authenticationManager: AuthenticationManager,
         accessProviderManager: AccessProviderProtocol,
         dataFormatter: MainViewDataFormatterProtocol) {
        self.authenticationManager = authenticationManager
        self.accessProviderManager = accessProviderManager
        self.dataFormatter = dataFormatter
        listenUserState()
    }
    
    func subscribeLoginState(with completion: @escaping BooleanCompletionBlock) {
        loginStateListener = completion
    }
    
    func getData() {
        mainViewState?(.loading)
        do {
            guard let urlRequest = try? CharacterListServiceProvider(request: getCharacterListRequest()).returnUrlRequest() else { return }
            fireApiCall(with: urlRequest, with: dataListener)
        }
        
    }
    
    func subscribeViewState(with completion: @escaping (ViewStates) -> Void) {
        mainViewState = completion
    }
    
    func subscribeDetailViewState(with completion: @escaping ItemDetailRequestBlock) {
        detailViewState = completion
    }
    
    // MARK: - Private Methods
    private func listenUserState() {
        authenticationManager.isLoggedIn(with: isLoggedInListener)
    }
    
    private func fireApiCall(with request: URLRequest, with completion: @escaping (Result<CharacterDataResponse, ErrorResponse>) -> Void) {
        
        ApiManagerBuilder.build().executeRequest(urlRequest: request, completion: completion)
        
    }
    
    private func getCharacterListRequest() -> CharacterDataRequest {
        return CharacterDataRequest(
            offset: dataFormatter.paginationData.offset,
            limit: dataFormatter.paginationData.limit,
            ts: accessProviderManager.returnUniqueData(),
            apikey: accessProviderManager.returnApiKey(),
            hash: accessProviderManager.returnHash())
    }
    
    private func loggedInListenerHandler(with value: Bool) {
        if value {
            getData()
        }
    }
    
    private func apiCallHandler(from response: CharacterDataResponse) {
        dataFormatter.setData(with: response)
        mainViewState?(.done)
    }
    
    // MARK: - Listener Handlers
    private lazy var isLoggedInListener: BooleanCompletionBlock = { [weak self] value in
        print("test : \(value)")
        self?.loggedInListenerHandler(with: value)
    }
    
    private lazy var dataListener: (Result<CharacterDataResponse, ErrorResponse>) -> Void = { [weak self] result in
        
        self?.dataFormatter.paginationData.fetching = false
        
        switch result {
        case .failure(let error):
            print("error : \(error)")
        case .success(let response):
            self?.apiCallHandler(from: response)
        }
    }
    
}

// MARK: - ItemProviderProtocol
extension MainViewModel: ItemProviderProtocol {
   
    func getNumberOfSection() -> Int {
        return 0
    }
    
    func getNumberOfItem(in section: Int) -> Int {
        return dataFormatter.getNumbeOfItem(in: section)
    }
    
    func getData(at index: Int) -> GenericDataProtocol? {
        return dataFormatter.getItem(at: index)
    }
    
    func isLoadingCell(for index: Int) -> Bool {
        return index >= dataFormatter.getCount()
    }
    
    func getMoreData() {
        // check to get more data
        guard dataFormatter.paginationData.checkLoadingMore() else { return }
        dataFormatter.paginationData.nextOffset()
        getData()
    }
    
    func selectedItem(at index: Int) {
        print("index : \(index)")
        detailViewState?(ItemDetailViewRequest(id: dataFormatter.getItemId(at: index), type: .present))
    }
    
}
