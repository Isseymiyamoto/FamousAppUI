//
//  FeedController.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/04.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

private let identifier = "FeedCell"

class FeedController: UITableViewController{
    
    // MARK: - Properties
    
    
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureNavigationBar()
    }
    
    // MARK: - Selectors
    
    @objc func handleCameraButtonTapped(){
        print("DEBUG: camera button was tapped..")
    }
    
    @objc func handleMessageButtonTapped(){
        print("DEBUG: message button was tapped..")
    }
    
    
    // MARK: - Helpers
    
    func configreuTableView(){
        tableView.backgroundColor = .white
        tableView.register(FeedCell.self, forCellReuseIdentifier: identifier)
    }
    
    func configureNavigationBar(){
        navigationItem.title = "Logo挿入"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "camera"), style: .plain, target: self, action: #selector(handleCameraButtonTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "paperplane"), style: .plain, target: self, action: #selector(handleMessageButtonTapped))
        
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationItem.rightBarButtonItem?.tintColor = .black
    }

   

}


// MARK: - UITableViewControllerDelegate / DataSource

extension FeedController{
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! FeedCell
        return cell
    }
}




