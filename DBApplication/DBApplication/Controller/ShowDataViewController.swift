//
//  ShowDataViewController.swift
//  DBApplication
//
//  Created by mac on 13/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ShowDataViewController: UIViewController {
    
    @IBOutlet weak var mytv: UITableView!
    @IBOutlet weak var txt_umob: UITextField!
    @IBOutlet weak var txt_ufnm: UITextField!
    @IBOutlet weak var txt_ucity: UITextField!
    @IBOutlet weak var txt_uemail: UITextField!
    
    
    var alldata = Array<Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchalldata()
        // Do any additional setup after loading the view.
    }

    @IBAction func btn_update(_ sender: Any) {
        updatedata()
        fetchalldata()
    }
    @IBAction func btn_back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    func updatedata () {
        if txt_ufnm.text == "" || txt_ucity.text == "" || txt_uemail.text == "" || txt_umob.text == "" {
            
            let alert = UIAlertController(title: "Failed", message: "Please Fill All Data Properly", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: {Action in
                self.txt_ufnm.text = ""
                self.txt_ucity.text = ""
                self.txt_uemail.text = ""
                self.txt_umob.text = ""
                self.txt_ufnm.layer.borderWidth = 0
                self.txt_ucity.layer.borderWidth = 0
                self.txt_uemail.layer.borderWidth = 0
                self.txt_umob.layer.borderWidth = 0
            })
            let MORE = UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            
            alert.addAction(OK)
            alert.addAction(MORE)
            present(alert,animated: true)
            
            if txt_ufnm.text == "" {
                txt_ufnm.layer.borderColor = UIColor.red.cgColor
                txt_ufnm.layer.borderWidth = 2.5
            } ;if txt_ucity.text == "" {
                txt_ucity.layer.borderColor = UIColor.red.cgColor
                txt_ucity.layer.borderWidth = 2.5
            } ;if txt_uemail.text == "" {
                txt_uemail.layer.borderColor = UIColor.red.cgColor
                txt_uemail.layer.borderWidth = 2.5
            } ;if txt_umob.text == "" {
                txt_umob.layer.borderColor = UIColor.red.cgColor
                txt_umob.layer.borderWidth = 2.5
            }
            
        } else {
            let updatedata = "update userinfo set city='\(txt_ucity.text!)',email='\(txt_uemail.text!)',mobile=\(txt_umob.text!) where fullname='\(txt_ufnm.text!)'"
            print(updatedata)
            
            let dml=DMLOperations()
            let result = dml.dmlservices(query: updatedata)
            
            if result == true {
                
                let alert = UIAlertController(title: "Success", message: "Your Data Has Been Updated", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    
                    self.txt_ufnm.text = ""
                    self.txt_ucity.text = ""
                    self.txt_uemail.text = ""
                    self.txt_umob.text = ""
                    
                    self.fetchalldata()
                    self.mytv.reloadData()
                })
                alert.addAction(OK)
                present(alert,animated: true)
            }
        }
    }
    
    func fetchalldata () {
        let select_data = "select * from userinfo"
        let dml = DMLOperations()
        alldata = dml.showalldata(query: select_data)
        print(alldata)
    }
    func deletedata(txt: String) {
        print(txt)
        let delete_query = "delete from userinfo where fullname='\(txt)'"
        print(delete_query)
        
        let dml = DMLOperations()
        let result = dml.dmlservices(query: delete_query)
        
        if result == true {
            let alert = UIAlertController(title: "Success", message: "Data Deleted Successfully", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                
                self.fetchalldata()
                self.mytv.reloadData()
            })
            alert.addAction(OK)
            present(alert,animated: true)
        } else {
            
            let alert = UIAlertController(title: "Failed", message: " Failed", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
            
            alert.addAction(OK)
            present(alert,animated: true)
        }
    }
}
extension ShowDataViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alldata.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showdatacell") as! ShowDataTableViewCell
        let dc = alldata[indexPath.row] as! Dictionary<String,Any>
        cell.lbl_name.text = dc["fullname"] as? String
        cell.lbl_city.text = dc["city"] as? String
        cell.lbl_email.text = dc["email"] as? String
        cell.lbl_mobile.text = dc["mobile"] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete
        {
            let dc = alldata[indexPath.row] as! Dictionary<String,Any>
            self.deletedata(txt: dc["fullname"] as? String ?? "")
        }
    }
}
