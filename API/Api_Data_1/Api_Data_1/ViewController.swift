//
//  ViewController.swift
//  Api_Data_1
//
//  Created by mac on 03/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

struct apidata:Decodable {
    var name:String?
    var capital:String?
    var region:String?
}

class ViewController: UIViewController {
    
    var apiArray = [apidata]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPI()
    }
    
    func fetchAPI() {
        let url = URL(string: "https://restcountries.com/v2/all")
        
        do {
            let dt = try Data(contentsOf: url!)
            apiArray = try JSONDecoder().decode([apidata].self, from: dt)
            print(apiArray)
        } catch {
            print(error.localizedDescription)
        }
    }
}

extension ViewController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = apiArray[indexPath.row].name
        cell.detailTextLabel?.text = apiArray[indexPath.row].capital
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: apiArray[indexPath.row].name , message: apiArray[indexPath.row].region , preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        let MORE = UIAlertAction(title: "MORE", style: .destructive, handler: nil)
        alert.addAction(OK)
        alert.addAction(MORE)
        present(alert,animated: true)
    }
}
