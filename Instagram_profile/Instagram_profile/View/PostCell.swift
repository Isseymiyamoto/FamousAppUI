//
//  PostCell.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/09.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import Foundation
import UIKit

class PostCell: UICollectionViewCell{
    
    // MARK: - Properties
    
    let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.5
        
        addSubview(postImageView)
        postImageView.addConstraintsToFillView(self)
        postImageView.center(inView: self)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Helpers
    
    
    
    
}
