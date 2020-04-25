//
//  ViewController.swift
//  Gestures
//
//  Created by Mohammed J Hossain on 11/7/19.
//  Copyright © 2019 Mohammed J Hossain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let rSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_ : )))
        
        let lSwipe = UISwipeGestureRecognizer(target: self, action: #selector(swipeAction(_ : )))
        
        rSwipe.direction = .right
        lSwipe.direction = .left
        
        view.addGestureRecognizer(rSwipe)
        view.addGestureRecognizer(lSwipe)
        
    }

    @objc func swipeAction(_ send: UISwipeGestureRecognizer) {
        if(send.direction == .left){
            performSegue(withIdentifier: "leftSeg", sender: self)
        } else if (send.direction == .right) {
            performSegue(withIdentifier: "rightSeg", sender: self)
        }
    }

}

