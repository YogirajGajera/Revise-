//
//  ViewController.swift
//  Datepicker
//
//  Created by mac on 19/01/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txt_1: UITextField!
    @IBOutlet weak var txt_2: UITextField!
    @IBOutlet weak var txt_3: UITextField!
    @IBOutlet weak var txt_4: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_1.delegate = self
        txt_2.delegate = self
        txt_3.delegate = self
        txt_4.delegate = self
    }

    @IBAction func btn_2nd(_ sender: Any) {
        let DatePikerViewController = self.storyboard?.instantiateViewController(withIdentifier: "DatePikerViewController") as! DatePikerViewController
         self.navigationController?.pushViewController(DatePikerViewController, animated: true)
    }
}
extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker()
    }
}
extension ViewController {
    func openDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.datePickerHandler(datePicker:)), for: .valueChanged)
        
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnClick))
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnClick))
        let flexiBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelBtn, flexiBtn, doneBtn], animated: true)
        txt_1.inputView = datePicker
        txt_1.inputAccessoryView = toolbar
        txt_2.inputView = datePicker
        txt_2.inputAccessoryView = toolbar

    }

@objc
func cancelBtnClick() {
    txt_1.resignFirstResponder()
    txt_2.resignFirstResponder()

}
@objc
func doneBtnClick() {
    if let datePicker = txt_1.inputView as? UIDatePicker {
        let dtf = DateFormatter()
        dtf.dateStyle = .medium
        txt_1.text = dtf.string(from: datePicker.date)
        print(datePicker.date)
        txt_1.resignFirstResponder()
    }
}
    @objc
    func datePickerHandler(datePicker: UIDatePicker) {
        print(datePicker.date)
    }
}

