//
//  ViewController.swift
//  DBApplication
//
//  Created by mac on 02/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var img_vc: UIImageView!
    @IBOutlet weak var txt_fullname: UITextField!
    @IBOutlet weak var txt_city: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_mobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func btn_save(_ sender: Any) {
        save_userinfo()
    }
    @IBAction func btn_logout(_ sender: Any) {
        UserDefaults.standard.setValue(false, forKey: "cuser")
        navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func btn_showdata(_ sender: Any) {
        let showdataVC = storyboard?.instantiateViewController(withIdentifier: "showdataVC") as! ShowDataViewController
        //present(showdataVC,animated: true)
        navigationController?.pushViewController(showdataVC, animated: true)
    }
    
    func save_userinfo() {
        if txt_fullname.text == "" || txt_city.text == "" || txt_email.text == "" || txt_mobile.text == ""
        {
            let alert = UIAlertController(title: "Error", message: "Please Input All Data...", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.txt_fullname.text = ""
                self.txt_city.text = ""
                self.txt_email.text = ""
                self.txt_mobile.text = ""
                self.txt_fullname.layer.borderWidth = 0
                self.txt_city.layer.borderWidth = 0
                self.txt_email.layer.borderWidth = 0
                self.txt_mobile.layer.borderWidth = 0
            })
            alert.addAction(OK)
            present(alert,animated: true)
            if txt_fullname.text == "" {
            txt_fullname.layer.borderColor = UIColor.red.cgColor
            txt_fullname.layer.borderWidth = 2.5
            } ; if txt_city.text == "" {
            txt_city.layer.borderColor = UIColor.red.cgColor
            txt_city.layer.borderWidth = 2.5
            } ; if txt_email.text == "" {
            txt_email.layer.borderColor = UIColor.red.cgColor
            txt_email.layer.borderWidth = 2.5
            } ; if txt_mobile.text == "" {
            txt_mobile.layer.borderColor = UIColor.red.cgColor
            txt_mobile.layer.borderWidth = 2.5
            }
        }
        else {
            let save_userinfo = "insert into userinfo(fullname,city,email,mobile) values('\(txt_fullname.text!)','\(txt_city.text!)','\(txt_email.text!)','\(txt_mobile.text!)')"
            print(save_userinfo)
            
            let dml=DMLOperations()
            let result = dml.dmlservices(query: save_userinfo)
            
            if result == true {
                let alert = UIAlertController(title: "Success", message: "Your Data Has Been Saved", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    self.txt_fullname.text = ""
                    self.txt_city.text = ""
                    self.txt_email.text = ""
                    self.txt_mobile.text = ""
                })
                alert.addAction(OK)
                present(alert,animated: true)
            }
            else {
                let alert = UIAlertController(title: "Error", message: "Something Went Wrong", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(OK)
                present(alert,animated: true)
            }
        }
    }
}
