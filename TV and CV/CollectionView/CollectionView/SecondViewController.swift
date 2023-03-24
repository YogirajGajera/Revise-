//
//  SecondViewController.swift
//  CollectionView
//
//  Created by mac on 21/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var img__: UIImageView!
    
    var m_img = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()

        img__.image = m_img
       
    }
}
