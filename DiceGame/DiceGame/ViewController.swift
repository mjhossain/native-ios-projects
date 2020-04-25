//
//  ViewController.swift
//  DiceGame
//
//  Created by Mohammed J Hossain on 10/31/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let diceImg = ["dice_1", "dice_2", "dice_3", "dice_4", "dice_5", "dice_6"]
   
    var exactNum = 0
    var usrMoney = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usrMoney = 100
        
        diceOne.image = UIImage(named: diceImg[0])
        diceTwo.image = UIImage(named: diceImg[5])
        totalLbl.text = "New Game"
        moneyLbl.text = String(usrMoney)
        // Do any additional setup after loading the view.
        
        //options
        
//
        
    }

    
    @IBOutlet weak var totalLbl: UILabel! // shows the total of a dice roll
    @IBOutlet weak var diceOne: UIImageView! // holds diceOne image
    @IBOutlet weak var diceTwo: UIImageView! // holds diceTwo image
    @IBOutlet weak var moneyLbl: UILabel! // shows the total money left
    @IBOutlet weak var betAmount: UITextField!
    
    
    //Options
    
    @IBOutlet weak var exactNumSwitch: UISwitch!
    @IBOutlet weak var exactNumInput: UITextField!
    
    @IBOutlet weak var evenOpt: UISwitch!
    @IBOutlet weak var oddOpt: UISwitch!
    @IBOutlet weak var above7Opt: UISwitch!
    @IBOutlet weak var below7Opt: UISwitch!
    
    
    @IBOutlet weak var rollBtn: UIButton!
    
    
    
    // Toggling Switches Functions
    
    
    @IBAction func TestFunc(_ sender: Any) {
        if(exactNumSwitch.isOn == true){
            evenOpt.isEnabled = false
            oddOpt.isEnabled = false
            above7Opt.isEnabled = false
            below7Opt.isEnabled = false
        } else {
            evenOpt.isEnabled = true
            oddOpt.isEnabled = true
            above7Opt.isEnabled = true
            below7Opt.isEnabled = true
        }
    }
    
    
    @IBAction func EvenOpt_Cahnged(_ sender: Any) {
        if(evenOpt.isOn == true){
            exactNumSwitch.isEnabled = false
            oddOpt.isEnabled = false
            above7Opt.isEnabled = false
            below7Opt.isEnabled = false
        } else {
            exactNumSwitch.isEnabled = true
            oddOpt.isEnabled = true
            above7Opt.isEnabled = true
            below7Opt.isEnabled = true
        }
    }
    
    
    @IBAction func OddOpt_Changed(_ sender: Any) {
        if(oddOpt.isOn == true){
            exactNumSwitch.isEnabled = false
            evenOpt.isEnabled = false
            above7Opt.isEnabled = false
            below7Opt.isEnabled = false
        } else {
            exactNumSwitch.isEnabled = true
            evenOpt.isEnabled = true
            above7Opt.isEnabled = true
            below7Opt.isEnabled = true
        }
    }
    
    
    @IBAction func Above7_Changed(_ sender: Any) {
        if(above7Opt.isOn == true){
            exactNumSwitch.isEnabled = false
            evenOpt.isEnabled = false
            oddOpt.isEnabled = false
            below7Opt.isEnabled = false
        } else {
            exactNumSwitch.isEnabled = true
            evenOpt.isEnabled = true
            oddOpt.isEnabled = true
            below7Opt.isEnabled = true
        }
    }
    
    
    
    @IBAction func Below7_Changed(_ sender: Any) {
        if(below7Opt.isOn == true){
            exactNumSwitch.isEnabled = false
            evenOpt.isEnabled = false
            oddOpt.isEnabled = false
            above7Opt.isEnabled = false
        } else {
            exactNumSwitch.isEnabled = true
            evenOpt.isEnabled = true
            oddOpt.isEnabled = true
            above7Opt.isEnabled = true
        }
    }
    
    
    
    // Reset Function
    
    @IBAction func resetGame(_ sender: Any) {
        usrMoney = 100
        diceOne.image = UIImage(named: diceImg[0])
        diceTwo.image = UIImage(named: diceImg[5])
        totalLbl.text = "New Game"
        moneyLbl.text = String(usrMoney)
    }
    
    
    
    // Rolling Dice Function
    
    @IBAction func rollDice(_ sender: Any) {
        
        let betMoney = Int(betAmount.text!)!
        
        if(betMoney == 0 || betMoney > usrMoney){
            showAlert()
        } else {
            var optSelected = selectOpt()
            //print(optSelected)
            if(optSelected > 0) {
                //print(exactNum)
                var dice_One = Int(arc4random_uniform(6))
                var dice_Two = Int(arc4random_uniform(6))
                
                var diceTotal = (dice_One + 1) + (dice_Two + 1)
                totalLbl.text = String(diceTotal)
                
                diceOne.image = UIImage(named: diceImg[dice_One])
                diceTwo.image = UIImage(named: diceImg[dice_Two])
                
                //Options Selections
                
                if(optSelected == 1){
                    if(diceTotal == exactNum) {
                        usrMoney += betMoney * 5
                        showWin()
                    } else {
                        usrMoney -= betMoney * 5
                        showLost()
                    }
                }
                
                
                else if (optSelected == 2) {
                    if(diceTotal % 2 == 0){
                        usrMoney += betMoney * 2
                        showWin()
                    } else {
                        usrMoney -= betMoney * 2
                        showLost()
                    }
                }
                
                
                else if (optSelected == 3) {
                    if(diceTotal % 2 != 0){
                        usrMoney += betMoney * 2
                        showWin()
                    } else {
                        usrMoney -= betMoney * 2
                        showLost()
                    }
                }
                
                    
                else if (optSelected == 4) {
                    if(diceTotal > 7){
                        usrMoney += betMoney * 2
                        showWin()
                    } else {
                        usrMoney -= betMoney * 2
                        showLost()
                    }
                }
                
                
                else if (optSelected == 5) {
                    if(diceTotal < 7){
                        usrMoney += betMoney * 2
                        showWin()
                    } else {
                        usrMoney -= betMoney * 2
                        showLost()
                    }
                }
                
                if(usrMoney <= 0) {
                    resetGame((Any).self)
                } else {
                    
                }
                
            } else {
                showAlert()
            }
            moneyLbl.text = String(usrMoney)
            betAmount.text = ""
            
        }
        
    }
    
    
    
    // Option Selection Function
    
    func selectOpt() -> Int {
        
        var opt = 0

        if(exactNumSwitch.isOn == true){
            exactNum = Int(exactNumInput.text!)!
            opt = 1
        } else if (evenOpt.isOn == true) {
            opt = 2
        } else if (oddOpt.isOn == true) {
            opt = 3
        } else if (above7Opt.isOn == true) {
           opt = 4
        } else if (below7Opt.isOn == true) {
            opt = 5
        }
        
        return opt
    }
    
    
    
    
    
    
    // Alert Functions
    
    func showAlert() {
    let alertController  = UIAlertController(title: "Alert", message: "Select an Option/Enter an amount to bet then ROLL", preferredStyle: .alert)

    let actionCancel = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction) in
        print("You've pressed cancel")
    }

    alertController.addAction(actionCancel);
        
    self.present(alertController, animated: true)
    }
    
    
    
    
    func showWin() {
    let alertController  = UIAlertController(title: "Alert", message: "Congratulations You Won!", preferredStyle: .alert)

    let actionCancel = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
    }

    alertController.addAction(actionCancel);
        
    self.present(alertController, animated: true)
    }

    
    
    func showLost() {
    let alertController  = UIAlertController(title: "Alert", message: "Aw! You Lost!", preferredStyle: .alert)

    let actionCancel = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
    }

    alertController.addAction(actionCancel);
        
    self.present(alertController, animated: true)
    }
    
    
    func gameReseted() {
    let alertController  = UIAlertController(title: "Alert", message: "Aw! You Lost! Game has been Reseted", preferredStyle: .alert)

    let actionCancel = UIAlertAction(title: "Okay", style: .default) { (action:UIAlertAction) in
    }

    alertController.addAction(actionCancel);
        
    self.present(alertController, animated: true)
    }
    
}

    
