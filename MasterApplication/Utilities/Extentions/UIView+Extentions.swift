//
//  UIView+Extentions.swift
//  AppPermissions
//
//  Created by Bengi on 29.09.2021.
//

import Foundation
import UIKit

// We wrote an extention for a view
extension UIView{
    
    func startTappedAnimation(with completion: @escaping (Bool) -> Void) {
        
        // scale the view with 0.95 ratio
        transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        
        // an animation like instagram like
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: {
            self.transform = CGAffineTransform.identity
        }, completion: completion)
        
        self.layoutIfNeeded()
    }
}
