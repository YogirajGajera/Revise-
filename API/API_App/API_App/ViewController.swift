//
//  ViewController.swift
//  API_App
//
//  Created by mac on 03/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var apidata = Array<Any>()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPI()
    }
    
    func fetchAPI() {
        let url = URL(string: "https://restcountries.com/v2/all")
        do {
            let dt = try Data(contentsOf: url!)
            apidata = try JSONSerialization.jsonObject(with: dt, options: []) as! [Any]
            print(apidata)
            
        }
        catch {
            print(error.localizedDescription)
        }
    }
}
extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apidata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dict = apidata[indexPath.row] as! Dictionary<String,Any>
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["capital"] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = apidata[indexPath.row] as! Dictionary<String,Any>
        let alert = UIAlertController(title: dict["name"] as? String, message: String(dict["population"] as! Int), preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        let MORE = UIAlertAction(title: "MORE", style: .destructive, handler: nil)
        alert.addAction(OK)
        alert.addAction(MORE)
        present(alert,animated: true)
    }
}

