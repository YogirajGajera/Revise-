//
//  ViewController.swift
//  table2
//
//  Created by mac on 01/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var student=[""]
    var img = [UIImage]()
    override func viewDidLoad() {
        super.viewDidLoad()
        student=["Yogiraj", "Nirav", "Parag", "Gautam"]
        img=[#imageLiteral(resourceName: "04"),#imageLiteral(resourceName: "01"),#imageLiteral(resourceName: "02"),#imageLiteral(resourceName: "03")]
    }
    
}

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return student.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text=student[indexPath.row]
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

