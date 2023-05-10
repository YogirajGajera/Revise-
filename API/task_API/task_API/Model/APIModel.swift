//
//  APIModel.swift
//  task_API
//
//  Created by mac on 07/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import Foundation

struct Welcome:Codable {

    var results : Array<Result>?
}
struct Result:Codable {

    let artistName: String?
    let artistLinkURL: String?
    let primaryGenreName: String?

}
