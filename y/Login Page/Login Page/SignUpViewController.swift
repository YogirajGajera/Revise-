//
//  SignUpViewController.swift
//  Login Page
//
//  Created by mac on 23/01/23.
//  Copyright © 2023 mac. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var txt_fnm: UITextField!
    @IBOutlet weak var txt_lnm: UITextField!
    @IBOutlet weak var txt_city: UITextField!
    @IBOutlet weak var txt_CreatPass: UITextField!
    
    var city = [""]
    var citypicker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        txt_CreatPass.delegate = self
        citypicker.dataSource = self
        citypicker.delegate = self
        city = ["Ahmedabad","Rajkot","Vadodara","Surat","Amreli"]
        txt_city.inputView = citypicker
    }
    
     @IBAction func btn_Signup(_ sender: Any) {
        let alert = UIAlertController(title: "SignUp Successed", message: "", preferredStyle: .alert)
        let btn = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(btn)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func btn_Rlogin(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension SignUpViewController:UIPickerViewDataSource,UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return city.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return city[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txt_city.text = city[row]
        view.endEditing(true)
    }
    
}
extension SignUpViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.openDatePicker()
    }
}
extension SignUpViewController {
    func openDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(self.datePickerHandler(datePicker:)), for: .valueChanged)
        
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44))
        let cancelBtn = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelBtnClick))
        let doneBtn = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(self.doneBtnClick))
        let flexiBtn = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([cancelBtn, flexiBtn, doneBtn], animated: true)
        txt_CreatPass.inputView = datePicker
        
        txt_CreatPass.inputAccessoryView = toolbar
        
    }
    
    @objc
    func cancelBtnClick() {
        txt_CreatPass.resignFirstResponder()
        
    }
    @objc
    func doneBtnClick() {
        if let datePicker = txt_CreatPass.inputView as? UIDatePicker {
            let dtf = DateFormatter()
            dtf.dateStyle = .medium
            txt_CreatPass.text = dtf.string(from: datePicker.date)
            print(datePicker.date)
        }
        txt_CreatPass.resignFirstResponder()
    }
    @objc
    func datePickerHandler(datePicker: UIDatePicker) {
        print(datePicker.date)
    }
}


