//
//  ViewController.swift
//  Date
//
//  Created by mac on 25/01/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txt_dtp: UITextField!
    var dtp = UIDatePicker()
    var date = ["dd/MM/yyyy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dtp.datePickerMode = .date
    
        txt_dtp.inputView = dtp
    }
}

