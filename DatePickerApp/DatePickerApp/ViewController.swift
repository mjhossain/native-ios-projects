//
//  ViewController.swift
//  DatePickerApp
//
//  Created by Mohammed J Hossain on 12/7/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var submitBtn: UIButton!
    @IBOutlet weak var inputDate: UITextField!
    
    var datePicker: UIDatePicker?
    
    var nameVar: String = ""
    var emailVar: String = ""
    var dateVar: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        submitBtn.layer.cornerRadius = submitBtn.frame.height/2
        
        
        
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(ViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(tapGesture:)))
        
        view.addGestureRecognizer(tapGesture)
        
        inputDate.inputView = datePicker
    }
    
    @objc func viewTapped(tapGesture: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        inputDate.text = dateFormatter.string(from: datePicker.date)
        //view.endEditing(true)
    }

    @IBAction func sendData(_ sender: Any) {
        self.nameVar = name.text!
        self.emailVar = email.text!
        self.dateVar = inputDate.text!
        
        performSegue(withIdentifier: "sendData", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! SecondViewController
        vc.getName = self.nameVar
        vc.getEmail = self.emailVar
        vc.getDate = self.dateVar
    }
    
}

