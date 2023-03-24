//
//  LoginViewController.swift
//  DBApplication
//
//  Created by mac on 03/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var img_login: UIImageView!

    @IBOutlet weak var txt_username: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        if UserDefaults.standard.bool(forKey: "cuser") == true {
            let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! ViewController
            //homeVC.modalPresentationStyle = .fullScreen
            //self.present(homeVC, animated: true, completion: nil)
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
    
    
    @IBAction func btn_login(_ sender: Any) {
        
        if txt_username.text == "" || txt_password.text == ""
        {
            let alert = UIAlertController(title: "Error", message: "Please Fill The Proper Details !!! ", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: {Action in
                self.txt_username.text = ""
                self.txt_password.text = ""
                self.txt_username.layer.borderWidth = 0
                self.txt_password.layer.borderWidth = 0
            })
            let MORE = UIAlertAction(title: "MORE", style: .destructive, handler: nil)
            alert.addAction(OK)
            alert.addAction(MORE)
            present(alert,animated: true)
            if txt_username.text == "" {
            txt_username.layer.borderColor = UIColor.red.cgColor
                txt_username.layer.borderWidth = 2.5 };
            if txt_password.text == "" {
            txt_password.layer.borderColor = UIColor.red.cgColor
                txt_password.layer.borderWidth = 2.5 };
        }
        else {
        let login_user = "select * from signup where username='\(txt_username.text!)' and password='\(txt_password.text!)'"
        print(login_user)
        
        let dml = DMLOperations()
        let cn = dml.loginuser(query: login_user)
        
        if cn.count>0 {
            let alert = UIAlertController(title: "Success", message: "Login Successfully", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.txt_username.text = ""
                self.txt_password.text = ""
                
                
// ------------ Generate the login Session ------------ //
                
                UserDefaults.standard.setValue(true, forKey: "cuser")
                
                
                let homeVC = self.storyboard?.instantiateViewController(withIdentifier: "homeVC") as! ViewController
                //homeVC.modalPresentationStyle = .fullScreen
                //self.present(homeVC, animated: true, completion: nil)
                self.navigationController?.pushViewController(homeVC, animated: true)
            })
            alert.addAction(OK)
            present(alert,animated: true, completion: nil)
        } else {
            let alert = UIAlertController(title: "Failed", message: "Login Failed", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
                self.txt_username.text = ""
                self.txt_password.text = ""
                self.txt_username.layer.borderWidth = 0
                self.txt_password.layer.borderWidth = 0})
            alert.addAction(OK)
            present(alert,animated: true)
            }
        }
    }
    
    @IBAction func btn_signup(_ sender: Any) {
        let signupVC = storyboard?.instantiateViewController(withIdentifier: "signupVC") as! SignupViewController
        navigationController?.pushViewController(signupVC, animated: true)
    }
}



