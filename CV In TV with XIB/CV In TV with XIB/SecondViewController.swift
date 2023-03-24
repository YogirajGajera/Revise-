//
//  SecondViewController.swift
//  CV In TV with XIB
//
//  Created by mac on 23/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var SVC_img: UIImageView!
    var m_SVC_img = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        SVC_img.image = m_SVC_img
    }

}
