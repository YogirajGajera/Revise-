//
//  HomeViewController.swift
//  Login Page
//
//  Created by mac on 23/01/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btn_Loginpage(_ sender: Any) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
