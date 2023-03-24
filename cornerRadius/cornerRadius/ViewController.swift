//
//  ViewController.swift
//  cornerRadius
//
//  Created by mac on 28/02/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var img = [""]
    var lbl_title = [""]
    var lbl_disc = [""]
    @IBOutlet weak var mytable: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        lbl_title = ["iOS","Android","Python","JAVA","PHP","React","Flutter"]
        lbl_disc = ["This Is Swift.","Android OS is a Linux-based mobile operating system that primarily runs on smartphones and tablets. The Android platform includes an operating system based upon the Linux kernel, a GUI, a web browser and end-user applications that can be downloaded.","Python is a computer programming language often used to build websites and software, automate tasks, and conduct data analysis. Python is a general-purpose language, meaning it can be used to create a variety of different programs and isn't specialized for any specific problems","What is Java? Java is a widely used object-oriented programming language and software platform that runs on billions of devices, including notebook computers, mobile devices, gaming consoles, medical devices and many others. The rules and syntax of Java are based on the C and C++ languages.","Hypertext Preprocessor,which the PHP FAQ describes as a recursive acronym. PHP is an alternative to Microsoft's Active Server Page (ASP) technology. As with ASP, the PHP script is embedded within a Web page along with its HTML. Before the page is sent to a user that has requested it, the Web server calls PHP to interpret and perform the operations called for in the PHP script.","React is a JavaScript-based UI development library. Facebook and an open-source developer community run it. Although React is a library rather than a language, it is widely used in web development. The library first appeared in May 2013 and is now one of the most commonly used frontend libraries for web development.","Flutter is Google's portable UI toolkit for crafting beautiful, natively compiled applications for mobile, web, and desktop from a single codebase. Flutter works with existing code, is used by developers and organizations around the world, and is free and open source."]
        img = ["1","2","3","4","5","6","1"]
    }
}
extension ViewController:UITableViewDataSource,UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lbl_title.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // mytable.rowHeight =
        mytable.estimatedRowHeight = UITableView.automaticDimension
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.layer.masksToBounds = true
        cell.clipsToBounds = true
        cell.layer.cornerRadius = 50.0
        
        //cell.layer.cornerRadius = cell.height/4
        cell.lbl_tit.text = lbl_title[indexPath.row]
        cell.lbl_data.text = lbl_disc[indexPath.row]
        cell.img_data.image = UIImage(named: img[indexPath.row])
        cell.btn_click.tag = indexPath.row
        cell.btn_click.addTarget(self, action: #selector(self.btnclick(_:)), for: .touchUpInside)
        //cell.btn_click.layer.cornerRadius = 10.0
        return cell
    }
    @objc func btnclick(_ sender : UIButton) {
        print("Button Clicked")
        let alert = UIAlertController(title: "Alert", message: "Button Clicked", preferredStyle: .alert)
        let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
        let MORE = UIAlertAction(title: "MORE", style: .destructive, handler: {ACTION in
            let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
            secondVC.img_s = UIImage(named: self.img[sender.tag]) ?? UIImage()
            secondVC.lbl_data_s = self.lbl_disc[sender.tag]
            secondVC.lbl_tit_s = self.lbl_title[sender.tag]
            
            self.navigationController?.pushViewController(secondVC, animated: true)
        })
        alert.addAction(OK)
        alert.addAction(MORE)
        present(alert,animated: true,completion: nil)
    }
    
}
