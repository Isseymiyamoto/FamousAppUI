//
//  ProfileFilterCell.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/08.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import UIKit

enum ProfileFilterOptions: Int, CaseIterable{
    case post
    case tag
    
    var systemImage: UIImage? {
        switch self {
        case .post: return UIImage(systemName: "rectangle.split.3x3")
        case .tag: return UIImage(systemName: "person.crop.rectangle")
        }
    }
}

class ProfileFilterCell: UICollectionViewCell{
    
    // MARK: - Properties
    
//    var options: ProfileFilterOptions! {
//
//    }
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    
    
}
