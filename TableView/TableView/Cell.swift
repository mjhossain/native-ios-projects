//
//  Cell.swift
//  TableView
//
//  Created by Mohammed J Hossain on 12/11/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {

    var userInfo: String = ""
    @IBOutlet weak var name: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
   
    
    
}
