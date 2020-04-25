//
//  ViewController.swift
//  TableView
//
//  Created by Mohammed J Hossain on 12/11/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    struct Person {
        var name: String
        var age: Int
    }
    
    

    @IBOutlet weak var tableView: UITableView!
    
    var persons: [Person] = []
    
    var person1 = Person(name: "Zakir", age: 22)
    var person2 = Person(name: "Fariha", age: 19)
    var person3 = Person(name: "David", age: 26)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        persons.append(person1)
        persons.append(person2)
        persons.append(person3)
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell") as! Cell
        
        
        cell.name?.text = persons[indexPath.row].name
        cell.userInfo = String(persons[indexPath.row].age)
        
        return cell
    }
    
    
    // This function allows each individual cell to perform Segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailsSegue", sender: self)
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetailsVC
        var indexPath = self.tableView.indexPathForSelectedRow!
        
        vc.getName = self.persons[indexPath.row].name
        vc.getInfo = String(self.persons[indexPath.row].age)
    }
    
}

