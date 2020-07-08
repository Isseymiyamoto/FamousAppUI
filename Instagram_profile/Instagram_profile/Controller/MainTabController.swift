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
        
        configureUI()
        configureViewControllers()
    }
        
    // MARK: - Helpers
    
    func configureUI(){
        view.backgroundColor = .white
        tabBar.tintColor = .black
    }
    
    func configureViewControllers(){
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: UIImage(systemName: "house"), rootViewController: feed)
        
        let search = SearchController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "magnifyingglass"), rootViewController: search)
        
        let upload = UploadPostController()
        let nav3 = templateNavigationController(image: UIImage(systemName: "plus.app"), rootViewController: upload)
        
        let notification = NotificationController()
        let nav4 = templateNavigationController(image: UIImage(systemName: "heart"), rootViewController: notification)
        nav4.tabBarItem.selectedImage = UIImage(systemName: "heart.fill")
        nav4.tabBarItem.badgeValue = "2"
        
        let profile = ProfileController(collectionViewLayout: UICollectionViewFlowLayout())
        let nav5 = templateNavigationController(image: UIImage(systemName: "person"), rootViewController: profile)
        
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
        
        // profileControllerを初期表示
        selectedIndex = 4
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



