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
    
    @IBAction func btnOpeator(_ sender: Any) {
    }
    
    
    
    

}

