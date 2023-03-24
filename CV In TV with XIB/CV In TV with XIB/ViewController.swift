//
//  ViewController.swift
//  CV In TV with XIB
//
//  Created by mac on 22/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

var eData = [
    EntertainmentApp(sectionType: "BollyWood", imageGallery: ["1","2","3","4","5","6","1"]),
    EntertainmentApp(sectionType: "Hollywood", imageGallery: ["4","2","3","4","5","6","4"]),
    EntertainmentApp(sectionType: "Wood", imageGallery: ["3","2","3","4","5","6","3"])
    
]

class ViewController: UIViewController {
    @IBOutlet weak var myTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTable.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }

}
func ontap() {
    
}
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return eData.count
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return eData[section].sectionType
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        cell.myCollectionView.tag = indexPath.section
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .yellow
    }
    
    
}
