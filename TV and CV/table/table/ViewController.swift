//
//  ViewController.swift
//  table
//
//  Created by mac on 01/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var city=[""]
    var img = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        city=["Ahmedabad", "Surat", "Baroda", "Gandhinagar"]
        img=[#imageLiteral(resourceName: "2"),#imageLiteral(resourceName: "1"),#imageLiteral(resourceName: "3"),#imageLiteral(resourceName: "4")]
    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate {
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return city.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
    cell.textLabel?.text=city[indexPath.row]
    cell.imageView?.image=img[indexPath.row]
    return cell
    }
func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]?
    {
        
        // action one
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            print("Edit tapped")
        })
        editAction.backgroundColor = UIColor.blue
        
        // action two
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            print("Delete tapped")
        })
        deleteAction.backgroundColor = UIColor.red
        
        return [editAction, deleteAction]
    }

    

}
