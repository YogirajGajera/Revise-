//
//  DMLOperations.swift
//  CoreData1
//
//  Created by mac on 23/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DMLOperations {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func savedata(data:[String:Any]) {
        let insert_data = NSEntityDescription.insertNewObject(forEntityName: "Entity", into: context) as! Entity
        insert_data.name = data["name"] as? String
        insert_data.email = data["email"] as? String
        insert_data.subject = data["subject"] as? String
        insert_data.mobile = Int64(data["mobile"] as! Int)
        
    }
    func showdata() -> [Entity] {
        var stdata = [Entity]()
        let req = NSFetchRequest<NSManagedObject>.init(entityName: "Entity")
        do {
            stdata = try context.fetch(req) as! [Entity]
        }
        catch {
            print(error.localizedDescription)
        }
        return stdata
    }
    func deletedata(index:Int)->[Entity] {
        var stdata = showdata()
        context.delete(stdata[index])
        stdata.remove(at: index)
        
        do {
                try context.save()
        }
        catch {
            print(error.localizedDescription)
        }
        return stdata
    }
}
