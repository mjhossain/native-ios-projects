//
//  ViewController.swift
//  ClassWork
//
//  Created by Mohammed J Hossain on 10/10/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    
    @IBOutlet weak var mySwitch: UISwitch!
    @IBOutlet weak var inputTxt: UITextField!
    @IBOutlet weak var txtLabel: UILabel!
    
//    func showAlert() {
//    let alertController  = UIAlertController(title: "Alert", message: "This is an alert.", preferredStyle: .alert)
//
//    let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
//        print("You've pressed cancel")
//    }
//
//    alertController.addAction(actionCancel);
//
//    self.present(alertController, animated: true)
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dest = segue.destination as! SecondViewController
        dest.data = inputTxt.text!
    }
    
    @IBAction func showTxt(_ sender: Any) {
        
        self.performSegue(withIdentifier: "transferData", sender: Any?.self)
    }
        
//        if(inputTxt.text == "") {
//            print("No text entered!")
//            showAlert()
//        } else {
//            txtLabel.text = inputTxt.text
//            self.performSegue(withIdentifier: "transferData", sender: Any?.self)
//        }
 //   }
    
//    @IBAction func textChanged(_ sender: Any) {
//        txtLabel.textColor=UIColor.red
//        txtLabel.text=inputTxt.text
//
//    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}


