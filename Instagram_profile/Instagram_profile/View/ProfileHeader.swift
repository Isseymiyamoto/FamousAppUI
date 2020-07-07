//
//  ProfileHeader.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/05.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

protocol ProfileHeaderDelegate: class {
    func handleEditProfile(_ header: ProfileHeader)
}

class ProfileHeader: UICollectionReusableView{
    
    // MARK: - Properties
    
    weak var delegate: ProfileHeaderDelegate?
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.image = UIImage(named: "profile_image")
        iv.layer.borderColor = UIColor.black.cgColor
        return iv
    }()
    
    private lazy var postCountButton = makeStatsButton(withNumber: "12")
    private lazy var followingCountButton = makeStatsButton(withNumber: "320")
    private lazy var followerCountButton = makeStatsButton(withNumber: "1000")
    
    private lazy var postCountLabel = makeStatsTitle(withTitle: "投稿")
    private lazy var followingCountLabel = makeStatsTitle(withTitle: "フォロー中")
    private lazy var followerCountLabel = makeStatsTitle(withTitle: "フォロワー")
    
    private let fullnameLabel: UILabel = {
        let label = UILabel()
        label.text = "ISSEY MIYAMOTO"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.text = "これはInstagramのプロフィールのUIをひたすらに真似する試みです。そうです。ただただ真似るだけです。"
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 3
        return label
    }()
    
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        
        let postCountStack = makeStatsStackView(button: postCountButton, label: postCountLabel)
        let followingCountStack = makeStatsStackView(button: followingCountButton, label: followingCountLabel)
        let followerCountStack = makeStatsStackView(button: followerCountButton, label: followerCountLabel)
        
        let infoStack = UIStackView(arrangedSubviews: [postCountStack, followingCountStack, followerCountStack])
        infoStack.axis = .horizontal
        infoStack.alignment = .center
        infoStack.distribution = .fillEqually
        
        addSubview(profileImageView)
        profileImageView.anchor(top: safeAreaLayoutGuide.topAnchor, left: leftAnchor, paddingTop: 16, paddingLeft: 16)
        profileImageView.setDimensions(width: 96, height: 96)
        profileImageView.layer.cornerRadius = 96 / 2
        
        addSubview(infoStack)
        infoStack.centerY(inView: profileImageView)
        infoStack.anchor(left: profileImageView.rightAnchor, right: rightAnchor, paddingLeft: 16, paddingRight: 32)
        
        addSubview(fullnameLabel)
        fullnameLabel.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 16, paddingLeft: 16, paddingRight: 16)
        
        addSubview(bioLabel)
        bioLabel.anchor(top: fullnameLabel.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 4, paddingLeft: 16, paddingRight: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
    
    func configureUI(){
        
    }
    
    fileprivate func makeStatsStackView(button: UIButton, label: UILabel) -> UIStackView{
        let stack = UIStackView(arrangedSubviews: [button, label])
        stack.axis = .vertical
        stack.alignment = .center
        stack.setDimensions(width: 160, height: 40)
        return stack
    }
    
    private func makeStatsButton(withNumber number: String) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(number, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        return button
    }
    
    private func makeStatsTitle(withTitle title: String) -> UILabel{
        let label = UILabel()
        label.text = title
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }
}
