//
//  ViewController.swift
//  CoreData1
//
//  Created by mac on 23/03/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    @IBOutlet weak var txt_name: UITextField!
    @IBOutlet weak var txt_email: UITextField!
    @IBOutlet weak var txt_subject: UITextField!
    @IBOutlet weak var txt_mobile: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) [0]
        print(path)
    }

    @IBAction func btn_showdata(_ sender: UIButton) {
        let ShowdataVC = storyboard?.instantiateViewController(withIdentifier: "ShowdataVC") as! ShowdataViewController
        self.navigationController?.pushViewController(ShowdataVC, animated: true)
//        showdata()
    }
    @IBAction func btn_save(_ sender: Any) {
        getdata()
    }
    func getdata() {
        let stdata = ["name":txt_name.text!,
                      "email":txt_email.text!,
                      "subject":txt_subject.text!,
                      "mobile":Int(txt_mobile.text!)!] as [String:Any]
        let dml=DMLOperations()
        dml.savedata(data: stdata)
        
        do {
            try context.save()
            let alert = UIAlertController(title: "Success", message: "Your Data Has Been Saved", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(OK)
            present(alert,animated: true)
        }
        catch {
            print(error.localizedDescription)
            let alert = UIAlertController(title: "Failed", message: "Something Went Wrong...!", preferredStyle: .alert)
            let OK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(OK)
            present(alert,animated: true)
        }
    }
//    func showdata() -> [Entity] {
//        var stdata = [Entity]()
//        let req = NSFetchRequest<NSManageObject
//        return stdata
//    }
}
