//
//  APIModel.swift
//  APITaskss
//
//  Created by mac on 17/05/23.
//  Copyright © 2023 mac. All rights reserved.
//

import Foundation


struct restData : Codable {
    var suggested_topics : [SuggestedTopics]?
}

struct SuggestedTopics : Codable {
    var id : String?
    var title : String?
    var posters : [Posters]?
}

struct Posters : Codable {
    var users : User?
}

struct User : Codable {
    var id : String?
    var username : String?
    var avatarTemlate : String?
    
    enum CodingKeys : String , CodingKey {
        case avatarTemlate = "avatar_template"
    }
}


