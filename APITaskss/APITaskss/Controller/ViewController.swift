//
//  ViewController.swift
//  APITaskss
//
//  Created by mac on 17/05/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tbl: UITableView!
    var alldata = [restData]()
    var getdata = ["Y","O","G","I"]
    override func viewDidLoad() {
        super.viewDidLoad()
        tbl.delegate = self
        tbl.dataSource = self
        getJson() { (json) in
            print(json)
        }
        self.tbl.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
       
        
    }
    func getJson(completion: @escaping ([SuggestedTopics])->()) {
        let urlstring = "https://discourse.fanzine.com/t/what-went-wrong-against-aston-villa-on-saturday/1063.json"
        if let url = URL(string: urlstring) {
            URLSession.shared.dataTask(with: url) {(data, res , err) in
                if let data = data {
                let decoder = JSONDecoder()
                do{
                    let json = try! decoder.decode([SuggestedTopics].self, from: data)
                    print(json)
                    completion(json)
                } catch let error{
                    print(error.localizedDescription)
                    }
            }
        }.resume()
    }
}
}
extension ViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alldata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell
     

        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
}
