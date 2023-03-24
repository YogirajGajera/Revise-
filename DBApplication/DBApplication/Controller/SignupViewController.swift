//
//  SignupViewController.swift
//  DBApplication
//
//  Created by mac on 03/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var img_signup: UIImageView!
    @IBOutlet weak var txt_firstname: UITextField!
    @IBOutlet weak var txt_lastname: UITextField!
    @IBOutlet weak var txt_username: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func btn_back_singup(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func Signup(_ sender: Any) {
        
        if txt_firstname.text == "" || txt_lastname.text == "" || txt_username.text == "" || txt_password.text == ""
        {
            let alert = UIAlertController(title: "Error", message: "Please Fill The Proper Details !!! ", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.txt_firstname.text = ""
                self.txt_lastname.text = ""
                self.txt_username.text = ""
                self.txt_password.text = ""
                self.txt_firstname.layer.borderWidth = 0
                self.txt_lastname.layer.borderWidth = 0
                self.txt_username.layer.borderWidth = 0
                self.txt_password.layer.borderWidth = 0
                
            })
            let MORE = UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(OK)
            alert.addAction(MORE)
            present(alert,animated: true)
            if txt_firstname.text == "" {
            txt_firstname.layer.borderColor = UIColor.red.cgColor
            txt_firstname.layer.borderWidth = 2.5
            } ; if txt_lastname.text == "" {
            txt_lastname.layer.borderColor = UIColor.red.cgColor
            txt_lastname.layer.borderWidth = 2.5
            } ; if txt_username.text == "" {
            txt_username.layer.borderColor = UIColor.red.cgColor
            txt_username.layer.borderWidth = 2.5
            } ; if txt_password.text == "" {
            txt_password.layer.borderColor = UIColor.red.cgColor
            txt_password.layer.borderWidth = 2.5
            }
        }
        else {
            let create_user = "insert into signup(firstname,lastname,username,password) values('\(txt_firstname.text!)','\(txt_lastname.text!)','\(txt_username.text!)','\(txt_password.text!)')"
            print(create_user)
            
            let dml = DMLOperations()
            let result = dml.dmlservices(query: create_user)
            
            if result == true {
                let alert = UIAlertController(title: "Success", message: "SignUp Successfully", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in

                    self.txt_firstname.text = ""
                    self.txt_lastname.text = ""
                    self.txt_username.text = ""
                    self.txt_password.text = ""
                    self.navigationController?.popToRootViewController(animated: true)
                    //self.present(loginVC, animated: true, completion: nil)
                })
                alert.addAction(OK)
                present(alert,animated: true)
                
            } else {
                let alert = UIAlertController(title: "Error", message: "SignUp Successfully", preferredStyle: .alert)
                let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                    
                    self.txt_firstname.text = ""
                    self.txt_lastname.text = ""
                    self.txt_username.text = ""
                    self.txt_password.text = ""
                    self.txt_firstname.layer.borderWidth = 0
                    self.txt_lastname.layer.borderWidth = 0
                    self.txt_username.layer.borderWidth = 0
                    self.txt_password.layer.borderWidth = 0})
                alert.addAction(OK)
                present(alert,animated: true)
            }
        }
    }
}

