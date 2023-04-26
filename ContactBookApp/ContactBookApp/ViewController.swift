//
//  ViewController.swift
//  ContactBookApp
//
//  Created by mac on 12/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit
import AddressBook
import AddressBookUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btn_contact(_ sender: Any) {
        let openContactbook = ABPeoplePickerNavigationController()
        present(openContactbook , animated: true , completion: nil)
    }
    
}

