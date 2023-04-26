//
//  Mytable+CoreDataProperties.swift
//  CoreData
//
//  Created by mac on 23/03/23.
//  Copyright © 2023 mac. All rights reserved.
//
//

import Foundation
import CoreData


extension Mytable {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mytable> {
        return NSFetchRequest<Mytable>(entityName: "Mytable")
    }

    @NSManaged public var name: String?
    @NSManaged public var subject: String?
    @NSManaged public var email: String?
    @NSManaged public var mobile: Int64

}
