//
//  LoggedIn.swift
//  PhotoClient
//
//  Created by Mohammed J Hossain on 12/10/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit
import Firebase


class LoggedIn: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    
    // Array of Client
    var clientArr: [Client] = []
    
    
    // Client Structures
    
    struct Client {
        var name: String
        var date: String
        var notes: String
        var numOfPeople: Int
        var venue: String
        var imageName: String
    }
    
    
    // Creating Clients
    var client1 = Client(name: "Jon", date: "01/12/2020", notes: "We want Photographs and Videos", numOfPeople: 150, venue: "Sterling - LI", imageName: "cli1")
    var client2 = Client(name: "Jason", date: "01/28/2020", notes: "We want Photos only", numOfPeople: 80, venue: "Okra House - TX", imageName: "cli2")
    var client3 = Client(name: "Smith", date: "02/01/2020", notes: "We want alot of group photos", numOfPeople: 200, venue: "Top of the Town", imageName: "cli3")
    var client4 = Client(name: "Joe", date: "02/12/2020", notes: "We want Video", numOfPeople: 50, venue: "LIC Garden", imageName: "cli4")
    var client5 = Client(name: "Chris", date: "02/24/2020", notes: "No comments", numOfPeople: 100, venue: "Town Hall - NJ", imageName: "cli5")
    var client6 = Client(name: "Vicky", date: "03/20/2020", notes: "Photos & Videos", numOfPeople: 25, venue: "City Hall - NYC", imageName: "cli6")
    
    
    
    var ref = Database.database().reference()
    
    // Variables for Table and from Database
    var getEmail: String = ""
    
    // Variables from Database
    var email: String = ""
    var id = Int()
    var name: String = ""
    
    
    
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(getEmail == "user1@xyz.com") {
            clientArr.append(client1)
            clientArr.append(client2)
        } else if(getEmail == "user2@xyz.com") {
            clientArr.append(client3)
            clientArr.append(client4)
        } else if(getEmail == "user6@xyz.com") {
            clientArr.append(client5)
            clientArr.append(client6)
        } else {
            print("No Clients")
        }
        
        
        
        // Assigning TableView
        tableView.dataSource = self
        tableView.delegate = self

        // Do any additional setup after loading the view.
        
        // Setting up logout button and action
        var backBtn: UIBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        self.navigationItem.leftBarButtonItem = backBtn
        
        // Authencating users from Firebase
        let userID = Auth.auth().currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
          // Get user values and assigning them to a variable
          var value = snapshot.value as? NSDictionary
            self.email = value?["email"] as? String ?? ""
            self.emailLbl.text = self.email
            self.name = value?["name"] as? String ?? ""
            self.nameLbl.text = self.name
            
 
          // ...
          }) { (error) in
            print(error.localizedDescription)
        }
   
    }
    
  // Logout Function
    @objc func handleLogout() {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
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
    
    
    
    
    // Table View Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return clientArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! TableViewCell
        cell.nameLbl?.text = clientArr[indexPath.row].name
        
        
        return cell
    }
    
    // Function to Perform Cell Segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "clientSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "clientSegue") {
            
            var indexPath = self.tableView.indexPathForSelectedRow!
            
            let vc = segue.destination as! ClientDetails
            vc.getClientName = self.clientArr[indexPath.row].name
            vc.getImg = self.clientArr[indexPath.row].imageName
            vc.getDate = self.clientArr[indexPath.row].date
            vc.getClientNotes = self.clientArr[indexPath.row].notes
            vc.getNumOfPeople = String(self.clientArr[indexPath.row].numOfPeople)
            vc.getVenue = self.clientArr[indexPath.row].venue
        }
    }

}
