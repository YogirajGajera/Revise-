//
//  DetailViewController.swift
//  task_api2
//
//  Created by mac on 07/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lbl_state: UILabel!
    @IBOutlet weak var lbl_stcode: UILabel!
    
    var str_state = ""
    var str_stcode = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        lbl_state.text = str_state
        lbl_stcode.text = str_stcode
    }

}
