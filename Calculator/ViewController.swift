//
//  ViewController.swift
//  Calculator
//
//  Created by Aaron Xue on 2019/9/24.
//  Copyright © 2019 Aaron Xue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var outlet: UILabel!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }

    var numOfSum = 0 { didSet { outlet.text = "\(numOfSum)" } }
    
    @IBOutlet var numButtons: [UIButton]!

    @IBAction func touchNum(_ sender: UIButton) {
        if let txtNumber = numButtons.firstIndex(of: sender){
            numOfSum = txtNumber
        }
    }
    
    //    if let cardNumber = cardButtons.firstIndex(of: sender) {
//        game.chooseCard(at: cardNumber)
//        updateViewFromModel()
//    }
    
    

}

