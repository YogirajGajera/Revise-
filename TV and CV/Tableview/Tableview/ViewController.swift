//
//  ViewController.swift
//  Tableview
//
//  Created by mac on 25/01/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblview: UITableView!
    var img = [""]
    var Num = [""]
    var num = [""]
    override func viewDidLoad() {
        super.viewDidLoad()
        img = ["1","2","3","4","5","6","7","8"]
        Num = ["1","2","3","4","5","6","7","8"]
        num = ["12","23","34","45","56","67","78","89"]
    }

}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return img.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" ) as! TableViewCell
        cell.img.image = UIImage(named: img[indexPath.row])
        cell.lbl_1.text = Num[indexPath.row]
        cell.lbl_2.text = num[indexPath.row]
        return cell
    }

}

