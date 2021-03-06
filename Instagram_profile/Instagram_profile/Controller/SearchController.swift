//
//  SearchController.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/04.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

class SearchController: UIViewController {

    // MARK: - Properties
    
    private let dammyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dammy View", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .systemPurple
        return button
    }()
    
    
    // MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI(withTitle: "探す")
    }
    
    
    // MARK: - Helpers
    
    func configureUI(withTitle title: String){
        view.backgroundColor = .white
        
        navigationItem.title = title
        
        view.addSubview(dammyButton)
        dammyButton.center(inView: view)
        dammyButton.anchor(left: view.leftAnchor, right: view.rightAnchor, paddingLeft: 16, paddingRight: 16, height: 56)
        dammyButton.layer.cornerRadius = 4
    }
}
