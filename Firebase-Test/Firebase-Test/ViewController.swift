//
//  ViewController.swift
//  Firebase-Test
//
//  Created by Mohammed J Hossain on 12/3/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnSignUp(_ sender: Any) {
        if (username.text!.isEmpty || password.text!.isEmpty) {
            print("Enter username and password!")
        }
        else {
            Auth.auth().createUser(withEmail: username.text!, password: password.text!)
        }
    }
    
    
    @IBAction func btnSignIn(_ sender: Any) {
        if (username.text!.isEmpty || password.text!.isEmpty) {
            print("Enter username and password!")
        }
        else {
            Auth.auth().signIn(withEmail: username.text!, password: password.text!) { [weak self] authResult, error in
                guard self != nil else { return }
              // ...
                print("Sign In Successful!")
            }
        }
    }
    
    
    
    func showAlert() {
        
    let alertController  = UIAlertController(title: "Alert", message: "User already exists.", preferredStyle: .alert)
    
    let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
        print("You've pressed cancel")
    }
    
    alertController.addAction(actionCancel);
        
    self.present(alertController, animated: true)
    }
    

}

