//
//  AddToArray.swift
//  FinalsProject
//
//  Created by Mohammed J Hossain on 12/13/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class AddToArray: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    
    var datePicker: UIDatePicker!
    var newImgName: String!
    var imageTaken: Bool!
    
    // Inputfields
    
    @IBOutlet weak var birthDateField: UITextField!
    @IBOutlet weak var noteInput: UITextView!
    @IBOutlet weak var locationText: UITextField!
    
    
    // Variables to hold input
    //var date: String!
    
    
    @IBOutlet weak var takePicBtn: UIButton!
    @IBOutlet weak var submitBtn: UIButton!
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    var imagePicker : UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.title = "Add Image"

        // Do any additional setup after loading the view.
        imageTaken = false
        datePicker = UIDatePicker()
        datePicker?.datePickerMode = .date
        datePicker?.addTarget(self, action: #selector(self.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped(tapGesture:)))
        
        view.addGestureRecognizer(tapGesture)
        
        birthDateField.inputView = datePicker
        takePicBtn.layer.cornerRadius = 15
        submitBtn.layer.cornerRadius = 15
        noteInput.layer.borderColor = UIColor.black.cgColor
        noteInput.layer.borderWidth = 5
        
        
        // Code to scroll view if keyboard pops up
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil);
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
    }
    
    
    // function to adjust screen size when keyboard shows
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else {return}
        guard let keyboardSize = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else {return}
        let keyboardFrame = keyboardSize.cgRectValue
        if self.view.frame.origin.y == 0{
            self.view.frame.origin.y -= keyboardFrame.height
        }
    }
    
    // function to reset screen size when keyboard goes down
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
    
    
    // this function handles the datepicker when a user taps anywhere on the screen
    @objc func viewTapped(tapGesture: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    
    // this function handles when the user changes the date on the date field using the UIDatePicker
    @objc func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        birthDateField.text = dateFormatter.string(from: datePicker.date)
        //view.endEditing(true)
    }
    

    // lets an user open the camera to take a photo
    @IBAction func takePhoto(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
        imageTaken = true
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        imagePicker.dismiss(animated: true, completion: nil)
        imageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
    }
    
     
    // this function is used to let the user save an image taken into the device
    func saveImg(imageName: String) {
        let fileManager = FileManager.default
        //get the image path
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(imageName)
        //get the image we took with camera
        let image = imageView.image!
        //get the PNG data for this image
        let data = image.pngData()
        //store it in the document directory
        fileManager.createFile(atPath: imagePath as String, contents: data, attributes: nil)
        print(imagePath)
        newImgName = imagePath
    }
    
    @IBAction func submitInfo(_ sender: Any) {
        
        if(imageTaken && birthDateField.text != "" && locationText.text != "" && noteInput.text != "") {
            let randomNum = Int.random(in: 0...1000)
            let imgName = "imgTaken" + String(randomNum)
            saveImg(imageName: imgName)
            performSegue(withIdentifier: "submitSegue", sender: self)
        } else {
            showAlert()
        }
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "submitSegue") {
            let vc = segue.destination as! ViewController
            if(imageTaken) {
                // calling a function from the first View
                vc.addNewPersonFrom(imgName: newImgName, location: locationText.text!, date: String(birthDateField.text!), note: noteInput.text!)
            }
            
        }
    }
    
    // Popup Functions
    func showAlert() {
        let alertController  = UIAlertController(title: "Alert", message: "Please complete all form fields!", preferredStyle: .alert)
        
        let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
            print("You've pressed cancel")
        }
        
        alertController.addAction(actionCancel);
            
        self.present(alertController, animated: true)
    }
    
    

}
