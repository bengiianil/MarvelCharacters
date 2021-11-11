//
//  ApiCallListenerManager.swift
//  WeatherApplication
//
//  Created by Erkut Bas on 24.10.2021.
//

import Foundation
import DefaultNetworkOperationPackage

class ApiCallListenerManager: ApiCallListener {
    
    private let animationManager: LottieManagerProtocol
    
    init(animationManager: LottieManagerProtocol) {
        self.animationManager = animationManager
    }
    
    func onPreExecute() {
        print("\(#function)")
        animationManager.onPreExecute()
    }
    
    func onPostExecute() {
        print("\(#function)")
        animationManager.onPostExecute()
    }
    
}
