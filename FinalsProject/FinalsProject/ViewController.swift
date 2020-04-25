//
//  ViewController.swift
//  FinalsProject
//
//  Created by Mohammed J Hossain on 12/13/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit


struct Person {

    var image: String
    var location: String
    var date: String
    var note: String
    
}


var myArr: [Person] = [
    Person(image: "moh1", location: "New York", date: "02/11/2019", note: "Sample Text Here"),
    Person(image: "moh2", location: "New York", date: "03/20/2019", note: "Sample Text Here"),
    Person(image: "moh3", location: "New York", date: "03/25/2019", note: "Sample Text Here"),
    Person(image: "moh4", location: "New Jersey", date: "04/03/2019", note: "Sample Text Here"),
    Person(image: "moh5", location: "New York", date: "04/10/2019", note: "Sample Text Here"),
    Person(image: "moh6", location: "New York", date: "04/11/2019", note: "Sample Text Here"),
    Person(image: "moh7", location: "Texas", date: "04/20/2019", note: "Sample Text Here"),
    Person(image: "moh8", location: "New York", date: "05/16/2019", note: "Sample Text Here"),
    Person(image: "moh9", location: "New York", date: "05/19/2019", note: "Sample Text Here"),
    Person(image: "moh10", location: "New York", date: "05/25/2019", note: "Sample Text Here")
]

class ViewController: UIViewController {

    @IBOutlet weak var albumView: UICollectionView!
    
    var collectionViewLayout: UICollectionViewFlowLayout!

    
    var getImageNameToDelete: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        albumView.dataSource = self
        albumView.delegate = self
        
        // setting up right navbar button item
        let btnImg = UIImage(systemName: "plus")
        let rightBarBtn = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(addNewPerson))
        
        // adding an image on the right navbar button
        rightBarBtn.image = btnImg
        self.navigationItem.rightBarButtonItem = rightBarBtn
        
        // This is for debug only
        // Add a left bar button to print the myArr.count
        
        let leftBarBtn = UIBarButtonItem(image: UIImage(systemName: "info.circle"), style: .plain, target: self, action: #selector(showInfoScreen))
        self.navigationItem.leftBarButtonItem = leftBarBtn
        
        
        // Swipe gestures
        
        let rSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_ : )))
        
        let lSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_ : )))
        
        rSwipe.direction = .right
        lSwipe.direction = .left
        
        view.addGestureRecognizer(rSwipe)
        view.addGestureRecognizer(lSwipe)
        
        //albumView.backgroundView = UIImageView(image: UIImage(named: "albumBG"))
        
        
    }
    
    
    
    @objc func swipeAction(_ send: UISwipeGestureRecognizer) {
        if(send.direction == .left){
            performSegue(withIdentifier: "addToArraySegue", sender: self)
        } else if (send.direction == .right) {
            performSegue(withIdentifier: "infoSegue", sender: self)
        }
    }
    
    
    
    // right navbar button action
    @objc func addNewPerson() {
        //print("Add this function!")
        performSegue(withIdentifier: "addToArraySegue", sender: self)
        
    }
    
    // function to remove a photo from the arry of struct/grid of images
    @objc func removePerson(imgName: String) {
        let personIndex = myArr.firstIndex(where: {$0.image == imgName});
        myArr.remove(at: personIndex!)
    }
    
    
    // left navbar button action
    @objc func showInfoScreen() {
        performSegue(withIdentifier: "infoSegue", sender: self)
    }
    
    func addNewPersonFrom(imgName: String!, location: String!, date: String!, note: String!) {
        myArr.append(Person(image: imgName, location: location, date: date, note: note))
        //print(myArr)
    }
    
    
    // this function sets up the gridview layout
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        setUpCollectionViewIteamSize()
    }


    
    func setUpCollectionViewIteamSize() {
        if collectionViewLayout == nil {
            // set number of items in a row
            let numOfItemsPerRow: CGFloat = 3
            
            // sets the horizontal spacing between each item cell
            let lineSpacing: CGFloat = 5
            
            // sets the vertical spacing vetween each item cell
            let interItemSpacing: CGFloat = 5
            
            // defining the height and width of each item cell (To make it square we keep it same)
            let width = (albumView.frame.width - (numOfItemsPerRow - 1) * lineSpacing) / numOfItemsPerRow;
            let height = width
            
            collectionViewLayout = UICollectionViewFlowLayout()
            
            collectionViewLayout.itemSize = CGSize(width: width, height: height)
            // defining margin to 0
            collectionViewLayout.sectionInset = UIEdgeInsets.zero
            collectionViewLayout.scrollDirection = .vertical
            collectionViewLayout.minimumLineSpacing = interItemSpacing
            collectionViewLayout.minimumInteritemSpacing = lineSpacing
            
            // defining the Collectionview layout
            albumView.setCollectionViewLayout(collectionViewLayout, animated: true)
        }
    }
    
    
    // prepare funtion for the image details view segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "imageViewerSegue") {
            let item = sender as! Person
            let vc = segue.destination as! ImageViewer
            vc.getImage = item.image
            vc.getIndex = index(ofAccessibilityElement: item)
            vc.getDate = item.date
            vc.getLocation = item.location
            vc.getNote = item.note
        }
    }

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = albumView.dequeueReusableCell(withReuseIdentifier: "customCell", for: indexPath) as! CustomCollectionViewCell
        cell.personImg.image = UIImage(named: myArr[indexPath.item].image)
        //print(indexPath.item)
        
        if(indexPath.item < 10) {
            cell.personImg.image = UIImage(named: myArr[indexPath.item].image)
        } else {
            // code gets the image using FileManager
            let fileManager = FileManager.default
            let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(myArr[indexPath.item].image)
                // making sure that the file exists and then assigning the picture path to the struct
            if (fileManager.fileExists(atPath: imagePath)){
                cell.personImg.image = UIImage(contentsOfFile: imagePath)
            }else{
               print("Panic! No Image!")
            }
           
        }
            
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // getting the index to send it with the segue
        let item = myArr[indexPath.item]
        performSegue(withIdentifier: "imageViewerSegue", sender: item)
    }
    
}
