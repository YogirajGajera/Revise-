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
        
        let url = URL(string: "https://itunes.apple.com/lookup?id=909253&entity=album")
        
        URLSession.shared.dataTask(with: url!) { (data, responce, error) in
            do {
                let dict = try JSONSerialization.jsonObject(with: data!, options: []) as! Dictionary<String,Any>
                self.apidata = dict["results"] as! [Any]
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
        cell.textLabel?.text = dict["artistName"] as? String
        cell.detailTextLabel?.text = dict["primaryGenreName"] as? String
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dict = apidata[indexPath.row] as! Dictionary<String,Any>
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.str_name = dict["artistName"] as? String ?? ""
        detailVC.str_url = dict["collectionViewUrl"] as? String ?? ""
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
