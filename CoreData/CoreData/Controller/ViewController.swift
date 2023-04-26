//
//  ViewController.swift
//  CoreData
//
//  Created by mac on 23/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController {
    let context=(UIApplication.shared.delegate as! AppDelegate).persi
    
    @IBOutlet weak var txt_name: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_subject: UITextField!
    @IBOutlet weak var txt_mobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btn_save(_ sender: Any) {
        getdata()
    }
    func getdata() {
        var stdata = ["name":txt_name.text!,
                      "email":txt_email.text!,
                      "subject":txt_subject.text!,
                      "mobile":txt_mobile.text!]
        let dml=DMLOperations()
        dml.savedata(data: stdata)
    }
}

