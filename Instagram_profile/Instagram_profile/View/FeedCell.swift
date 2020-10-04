//
//  FeedCell.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/10/04.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell{
    
    // MARK: - Properties
    
    private let userInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "steve")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "user_name"
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    private let placemarkLabel: UILabel = {
        let label = UILabel()
        label.text = "place_mark"
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(userInfoView)
        userInfoView.anchor(top: topAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 0, paddingLeft: 0, paddingRight: 0, height: 80)
        
        let userInfoStack = UIStackView(arrangedSubviews: [userNameLabel, placemarkLabel])
        userInfoStack.axis = .vertical
        userInfoStack.spacing = 4
        userInfoStack.alignment = .leading
        
        let topBarStack = UIStackView(arrangedSubviews: [profileImageView, userInfoStack])
        topBarStack.axis = .horizontal
        topBarStack.spacing = 12
        topBarStack.alignment = .center
        
        userInfoView.addSubview(topBarStack)
        userInfoView.frame = topBarStack.frame
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Helpers
    
}
