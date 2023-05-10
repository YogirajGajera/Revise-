//
//  APIModel.swift
//  APIData_3
//
//  Created by mac on 07/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import Foundation

struct restmodel:Codable {
    var name:String?
    var capital:String?
    var region:String?
    var flags=Flags()
}
struct Flags:Codable {
    var png:String?
}
