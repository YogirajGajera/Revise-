//
//  ShowdataViewController.swift
//  CoreData1
//
//  Created by mac on 24/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ShowdataViewController: UIViewController {
    
    @IBOutlet weak var mytbl: UITableView!
    var alldata = [Entity]()
    let dml = DMLOperations()
    var mysearch = UISearchController()
    @IBOutlet weak var showtbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "ShowdataTableViewCell", bundle: nil)
        mytbl.register(nib, forCellReuseIdentifier: "showdatacell")
        mytbl.dataSource = self
        mytbl.delegate = self
        navigationItem.searchController = mysearch
        displaydata()
    }
    
    func displaydata() {
        alldata = dml.showdata()
    }
}
extension ShowdataViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alldata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytbl.dequeueReusableCell(withIdentifier: "showdatacell" , for:indexPath) as! ShowdataTableViewCell
        cell.lblName.text = alldata[indexPath.row].name
        cell.lblEmail.text = alldata[indexPath.row].email
        cell.lblsubject.text = alldata[indexPath.row].subject
        cell.lblMobile.text = String(Int(alldata[indexPath.row].mobile))
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: alldata[indexPath.row].name, message: "Are You Sure You Want To Delete This Index", preferredStyle: .alert)
            let OK = UIAlertAction(title: "DELETE", style: .destructive, handler: {ACTION in
                self.alldata = self.dml.deletedata(index: indexPath.row)
                self.mytbl.deleteRows(at: [indexPath], with: .automatic)
            })
            let MORE = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            alert.addAction(OK)
            alert.addAction(MORE)
            present(alert,animated: true)
        }
    }
    
}
