//
//  DatePikerViewController.swift
//  Datepicker
//
//  Created by mac on 19/01/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class DatePikerViewController: UIViewController {

    @IBOutlet weak var txt_date: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func select_date(_ sender: UIDatePicker) {
        let dt = sender.date
        print(dt)
        let dtfrm = DateFormatter()
        dtfrm.dateFormat = "dd-MM-yyyy"
        txt_date.text = dtfrm.string(from: dt)
    }
}
