//
//  User.swift
//  Instagram_profile
//
//  Created by 宮本一成 on 2020/07/05.
//  Copyright © 2020 ISSEY MIYAMOTO. All rights reserved.
//

import Foundation

struct User {
    
    let uid: String
    var fullname: String
    var username: String
    var profileImageUrl: URL?
    var bio: String
    
    init(uid: String, dictionary: [String: Any]){
        self.uid = uid
        
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.bio = dictionary["bio"] as? String ?? ""
    }

}

struct UserRelationStats {
    var followers: Int
    var following: Int
}
