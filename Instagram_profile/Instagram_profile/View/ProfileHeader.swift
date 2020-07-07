//
//  ProfileHeader.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/05.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

class ProfileHeader: UICollectionReusableView{
    
    // MARK: - Properties
    
    private lazy var profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "profile_image")
        return iv
    }()
    
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, paddingTop: 32, paddingLeft: 16)
        profileImageView.setDimensions(width: 96, height: 96)
        profileImageView.layer.cornerRadius = 96 / 2
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
    
    func configureUI(){
        
    }
    
    
    
    
    
}
