//
//  TableViewCell.swift
//  PhotoClient
//
//  Created by Mohammed J Hossain on 12/12/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var nameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
