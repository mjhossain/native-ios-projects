//
//  ImageViewer.swift
//  FinalsProject
//
//  Created by Mohammed J Hossain on 12/13/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ImageViewer: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var getImage: String!
    var getDate: String!
    var getLocation: String!
    var getNote: String!
    var getIndex: Int!
    
    // Outlets
    
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var locationLbl: UILabel!
    @IBOutlet weak var noteLbl: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if(!getImage.isEmpty){
            imageView.image = UIImage(named: getImage)
            dateLbl.text = getDate
            locationLbl.text = getLocation
            noteLbl.text = getNote
            
        } else {
            print("Sorry image not found!")
        }
    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        performSegue(withIdentifier: "deleteCellSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "deleteCellSegue") {
            let vc = segue.destination as! ViewController
            vc.removePerson(imgName: getImage)
        }
    }
    

}
