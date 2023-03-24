//
//  ViewController.swift
//  Login Page
//
//  Created by mac on 23/01/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_password: UITextField!
    
    var email = "admin"
    var password = "admin"
    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.isNavigationBarHidden = true
    }


    @IBAction func btn_login(_ sender: UIButton) {
        if (txt_email.text == email) && (txt_password.text == password ) {
        let HomeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        self.navigationController?.pushViewController(HomeViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "LogIn Failed", message: "Enter Valid Email & Password", preferredStyle: .alert)
            let btn = UIAlertAction(title: "Cancel", style: .destructive, handler: nil)
            alert.addAction(btn)
            present(alert, animated: true, completion: nil)
        }
}
    @IBAction func btn_signup(_ sender: UIButton) {
        let SignUpViewController = self.storyboard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(SignUpViewController, animated: true)
    }
}

