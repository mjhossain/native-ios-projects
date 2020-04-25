//
//  SecondViewController.swift
//  DatePickerApp
//
//  Created by Mohammed J Hossain on 12/7/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var dateLbl: UILabel!
    
    var getName: String = ""
    var getEmail: String = ""
    var getDate: String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLbl.text = "Name: " + getName
        emailLbl.text = "Email: " + getEmail
        dateLbl.text = "Date: " + getDate
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
