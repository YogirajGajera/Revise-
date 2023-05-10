//
//  ViewController.swift
//  APIData_2
//
//  Created by mac on 07/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mytbl: UITableView!
    var apidata = Array<Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
        mytbl.delegate = self
        mytbl.dataSource = self
        restAPI()
        
        
    }
    func restAPI() {
        
        let url = URL(string: "https://dummyjson.com/products")
        
        URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            do {
                let data = try Data(contentsOf: url!)
                let dict = try JSONSerialization.jsonObject(with: data, options: []) as! Dictionary<String,Any>
                self.apidata = dict["products"] as! [Any]
                print(self.apidata)
                DispatchQueue.main.async {
                    self.mytbl.reloadData()
                }
            }
            catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
}
extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apidata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dict = apidata[indexPath.row] as! Dictionary<String,Any>
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = dict["title"] as? String
        cell.detailTextLabel?.text = dict["description"] as? String
        return cell
    }
    
    
}
