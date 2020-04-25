//
//  ViewController.swift
//  UI-Design
//
//  Created by Mohammed J Hossain on 9/17/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var uname: UITextField!
    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var View2: UIView!
    
    @IBOutlet weak var SuccessLbl: UILabel!
    
    
    @IBAction func btnLogin(_ sender: Any) {
        if(uname.text == "mjhossain" && pass.text == "password") {

        }
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

