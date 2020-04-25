//
//  ViewController.swift
//  TempConv
//
//  Created by Mohammed J Hossain on 10/14/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tempInput: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var dateSwitch: UISwitch!
    
    @IBOutlet weak var tempLabel: UILabel!
    
    @IBOutlet weak var helpTxt: UILabel!
    
    
    func showAlert() {
    let alertController  = UIAlertController(title: "Alert", message: "Please Enter the Temperature to Convert", preferredStyle: .alert)
    
    let actionCancel = UIAlertAction(title: "Ok", style: .cancel) { (action:UIAlertAction) in
        
    }
    
    alertController.addAction(actionCancel);
        
    self.present(alertController, animated: true)
    }
    
    @IBAction func toF(_ sender: UIButton) {
        if(tempInput.text == "") {
            helpTxt.textColor = UIColor.red;
            showAlert()
        } else {
            var finalTemp = 0
            var tempIn = Int(tempInput.text!)
            finalTemp = tempToF(temp: tempIn!)
            tempLabel.text = String(finalTemp) + " F"
            tempInput.text = ""
            helpTxt.textColor = UIColor.black;
        }
        
    }
    
    
    
    @IBAction func toC(_ sender: UIButton) {
        if(tempInput.text == "") {
            helpTxt.textColor = UIColor.red;
            showAlert()
        } else {
            var finalTemp = 0
            var tempIn = Int(tempInput.text!)
            finalTemp = tempToC(temp: tempIn!)
            tempLabel.text = String(finalTemp) + " C"
            tempInput.text = ""
            helpTxt.textColor = UIColor.black;
        }
    }
    
    func tempToC(temp: Int) -> Int {
        var tempF = (temp - 32) * 5/9
        return tempF
    }
    
    func tempToF(temp: Int) -> Int {
        var tempC = temp * 9/5 + 32
        return tempC
    }
    
    @IBAction func showDate(_ sender: UISwitch) {
        if(dateSwitch.isOn) {
            datePicker.isHidden = false
        } else {
            datePicker.isHidden = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.isHidden = true
        self.tempInput.keyboardType = .numberPad
        tempLabel.text = " "
        tempLabel.font  = tempLabel.font.withSize(50)
        // Do any additional setup after loading the view.
    }


}

