//
//  ViewController.swift
//  APIData_3
//
//  Created by mac on 07/04/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit
import WebKit
         
class ViewController: UIViewController,UISearchControllerDelegate {
    
    
    @IBOutlet weak var mytbl: UITableView!
    
    var mysearch = UISearchController(searchResultsController: nil)
    var apidata = [restmodel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAPI()
        searchsetup()
        
    }
    
    func searchsetup() {
        navigationItem.searchController = mysearch
        mysearch.delegate = self
        mysearch.searchResultsUpdater = self
    }
    
    func fetchAPI() {
        let url = URL(string: "https://restcountries.com/v2/all")
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            do {
                self.apidata = try JSONDecoder().decode([restmodel].self, from: data!)
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

extension ViewController:UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let searchtext = mysearch.searchBar.text else { return}
        
    if searchtext == ""
        {
            self.fetchAPI()
        } else {
            self.apidata = apidata.filter {
                ($0.name?.contains(searchtext))!
            }
        self.mytbl.reloadData()
        }
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apidata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
        cell.textLabel?.text = apidata[indexPath.row].name
        cell.detailTextLabel?.text = apidata[indexPath.row].capital
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = storyboard?.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.str_name = apidata[indexPath.row].name!
        detailVC.str_url = apidata[indexPath.row].flags.png!
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
