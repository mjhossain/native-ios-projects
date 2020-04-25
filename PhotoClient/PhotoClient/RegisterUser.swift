//
//  RegisterUser.swift
//  PhotoClient
//
//  Created by Mohammed J Hossain on 12/10/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RegisterUser: UIViewController {

    
    
    //var ref: DatabaseReference!

    var ref = Database.database().reference()
    
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var messageLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        messageLbl.text = ""
        
    }
    
    
    @IBAction func registerUser(_ sender: Any) {
        if(nameField.text!.isEmpty || emailField.text!.isEmpty || passwordField.text!.isEmpty) {
            messageLbl.text = "Please complete the fields above!"
        } else {
            addUser(name: nameField.text!, email: emailField.text!, password: passwordField.text!)
        }
    }
    
    
    func addUser(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password, completion: {
            (user, error) in
            if (error == nil) {
                self.ref.child("users").child((user?.user.uid)!).setValue(["email": email, "name":name])
                
            } else {
                if (error != nil){
                    print(error!)
                }
            }
        })
        navigationController?.popToRootViewController(animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
