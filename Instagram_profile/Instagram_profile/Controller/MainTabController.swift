//
//  MainTabController.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/04.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController{
    
    // MARK: - Properties
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
        
    // MARK: - Helpers
    
    func configureViewControllers(){
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(systemName: "house"), rootViewController: feed)
        
        let nav2 = templateNavigationController(image: UIImage(systemName: "magnifyingglass"), rootViewController: feed)
        let nav3 = templateNavigationController(image: UIImage(systemName: "plus.app"), rootViewController: feed)
        let nav4 = templateNavigationController(image: UIImage(systemName: "heart"), rootViewController: feed)
        
        let profile = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav5 = templateNavigationController(image: UIImage(systemName: "person"), rootViewController: profile)
        
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
    }
    
    func templateNavigationController(image: UIImage?, rootViewController: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = image
        nav.navigationBar.tintColor = .white
        return nav
    }
}

// MARK: - UITabBarControllerDelegate

extension MainTabController: UITabBarControllerDelegate{
    
}



