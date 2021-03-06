//
//  MainTabBarBuilder.swift
//  UIComponents
//
//  Created by Bengi on 5.10.2021.
//

import UIKit

 class MainTabBarBuilder {
     
     class func build() -> UIViewController {
                 
         let mainViewController = MainViewBuilder.build()
         let accountViewController = AccountViewBuilder.build()
                  
         let tabViewController = MainTabBarController()
         tabViewController.viewControllers = [mainViewController, accountViewController]
         tabViewController.tabBar.backgroundColor = .systemBackground
         tabViewController.tabBar.tintColor = .systemBlue
         return tabViewController
     }
 }
 
