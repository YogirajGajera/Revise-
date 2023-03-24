//
//  ShowdataViewController.swift
//  CoreData1
//
//  Created by mac on 24/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ShowdataViewController: UIViewController {

    @IBOutlet weak var showtbl: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
extension ShowdataViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showcell", for: indexPath) as! ShowdataTableViewCell
        return cell
    }
    
}
