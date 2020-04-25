//
//  FirstViewController.swift
//  PhotoClient
//
//  Created by Mohammed J Hossain on 10/17/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {

    
    // Input Fields
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var msgLbl: UILabel!
    
    // Buttons
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var registerBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        msgLbl.text = ""
        loginBtn.layer.cornerRadius = 25
        registerBtn.layer.cornerRadius = 25
    }

    
    @IBAction func btnSignIn(_ sender: Any) {
        if(email.text!.isEmpty || password.text!.isEmpty) {
            msgLbl.text = "Please enter email & password!"
        } else {
            Auth.auth().signIn(withEmail: email.text!, password: password.text!) { (user, error) in
            if error == nil{
                
                
              self.performSegue(withIdentifier: "LoginSegue", sender: self)
                self.email.text = ""
                self.password.text = ""
                }
                else {
                    self.msgLbl.text = "Invalid Login"
                }
            }
    
        }
    
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "LoginSegue") {
            let vc = segue.destination as! LoggedIn
            vc.getEmail = email.text!
        } else {
            
        }
        
    }
    
    
}

