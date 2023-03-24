//
//  SecondViewController.swift
//  cornerRadius
//
//  Created by mac on 28/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var img_second: UIImageView!
    @IBOutlet weak var lbl_tit_second: UILabel!
    @IBOutlet weak var lbl_data_second: UILabel!
    
    var img_s = UIImage()
    var lbl_tit_s = ""
    var lbl_data_s = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        lbl_tit_second.text = lbl_tit_s
        lbl_data_second.text = lbl_data_s
        img_second.image = img_s
    }
    @IBAction func Barbtn_back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
