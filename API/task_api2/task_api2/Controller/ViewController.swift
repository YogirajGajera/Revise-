//
//  ViewController.swift
//  task_API
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
        restAPI()
        mytbl.reloadData()
    }
    func restAPI() {
        
        let url = URL(string: "https://data.covid19india.org/data.json")
        
        URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            do {
                let dict = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String,Any>
                self.apidata = dict["statewise"] as! [Any]
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
        cell.textLabel?.text = dict["active"] as? String
        cell.detailTextLabel?.text = dict["confirmed"] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = apidata[indexPath.row] as! Dictionary<String,Any>
        let alert = UIAlertController(title: (dict["state"] as? String? ?? ""), message: (dict["deaths"] as? String ?? ""), preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: {ACTION in
            let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
            detailVC.str_state = dict["state"] as? String ?? ""
            detailVC.str_stcode = dict["statecode"] as? String ?? ""
            self.navigationController?.pushViewController(detailVC, animated: true)
        })
        
        alert.addAction(OK)
        
        present(alert,animated: true)
        
    }
    
}
