//
//  DetailsVC.swift
//  TableView
//
//  Created by Mohammed J Hossain on 12/12/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class DetailsVC: UIViewController {

    var getInfo: String = ""
    var getName: String = ""
    
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var infoLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        nameLbl.text = getName
        infoLbl.text = getInfo
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
