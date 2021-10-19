//
//  SplashViewModel.swift
//  MasterApplication
//
//  Created by Bengi on 17.10.2021.
//

import Foundation

typealias VoidCompletionBlock = () -> Void

class SplashViewModel {
    
    private var splashFinalizeListener: VoidCompletionBlock?
    
    init(completion: @escaping VoidCompletionBlock) {
        self.splashFinalizeListener = completion
    }
    
    func fireApplicationInitiateProcess() {
        DispatchQueue.main.asyncAfter(deadline: .now()+2) { [weak self] in
            self?.splashFinalizeListener?()
        }
    }
}
