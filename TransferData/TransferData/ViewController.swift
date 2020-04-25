//
//  ViewController.swift
//  TransferData
//
//  Created by Mohammed J Hossain on 10/29/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

   
    
    @IBOutlet weak var inTxt: UITextField!
    
    @IBAction func sendDat(_ sender: Any) {
        
        let dest = SecondViewController(nibName: "SecondViewController", bundle: nil)
        dest.text1 = inTxt.text!
        print(inTxt.text!)
        
        navigationController?.pushViewController(dest, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

