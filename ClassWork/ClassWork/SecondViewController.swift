//
//  SecondViewController.swift
//  ClassWork
//
//  Created by Mohammed J Hossain on 10/29/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var data:String = ""
    
    @IBOutlet weak var textLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textLbl.text = data
        // Do any additional setup after loading the view.
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
