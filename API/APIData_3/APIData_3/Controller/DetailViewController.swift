//
//  DetailViewController.swift
//  APIData_3
//
//  Created by mac on 07/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var my_lbl: UILabel!
    @IBOutlet weak var web_img: WKWebView!
    var str_name = ""
    var str_url = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        my_lbl.text = str_name
        
        let url = URL(string: str_url)
        let req = URLRequest(url: url!)
        web_img.load(req)
    }
}
