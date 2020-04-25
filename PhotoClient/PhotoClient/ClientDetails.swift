//
//  ClientDetails.swift
//  PhotoClient
//
//  Created by Mohammed J Hossain on 12/12/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ClientDetails: UIViewController {

    
    // Variables to get values through segue
    var getImg: String = ""
    var getClientName: String = ""
    var getClientNotes: String = ""
    var getNumOfPeople: String = ""
    var getVenue: String = ""
    var getDate: String = ""
    
    
    @IBOutlet weak var clientImg: UIImageView!
    @IBOutlet weak var clientName: UILabel!
    @IBOutlet weak var eventDate: UILabel!
    @IBOutlet weak var clientNotes: UILabel!
    @IBOutlet weak var numOfPeople: UILabel!
    @IBOutlet weak var venue: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        clientImg.image = UIImage(named: getImg)
        clientName.text = getClientName
        eventDate.text = getDate
        clientNotes.text = getClientNotes
        numOfPeople.text = getNumOfPeople
        venue.text = getVenue
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
