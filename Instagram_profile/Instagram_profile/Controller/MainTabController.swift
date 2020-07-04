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
        let nav1 = templateNavigationController(image: UIImage(systemName: ""), rootViewController: feed)
        
        let profile = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav4 = templateNavigationController(image: UIImage(systemName: ""), rootViewController: profile)
        
        viewControllers = [nav1, nav4]
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



