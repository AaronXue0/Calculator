//
//  ViewController.swift
//  Calculator
//
//  Created by Aaron Xue on 2019/9/24.
//  Copyright © 2019 Aaron Xue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var controller = Calculator()
    
    @IBOutlet weak var outlet: UILabel!
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }

    var numOfLabel = "0" { didSet { outlet.text = "\(numOfLabel)" } }
    
    @IBOutlet var numButtons: [UIButton]!

    @IBAction func touchNum(_ sender: UIButton) {
        if let txtNumber = numButtons.firstIndex(of: sender){
            if controller.operation > 0{
                controller.recordNumber = Double(txtNumber)
            }else{
                changeDisplayOfLabel(number: txtNumber)
            }
        }
        
    }
    
    @IBOutlet var opeatorButton: [UIButton]!
    
    @IBAction func touchOperator(_ sender: UIButton) {
        controller.reset = true
        if let opCode = opeatorButton.firstIndex(of: sender){
            controller.recordNumber = Double(Int(numOfLabel)!)
            switch opCode{
            case 0:controller.addition(
                num1: Int(controller.recordNumber),
                num2: Int(controller.numOfSum))
            default:
                print("error")
            }
            numOfLabel = String(Int(controller.numOfSum))
            print(numOfLabel,controller.numOfSum)
        }
    }

    func changeDisplayOfLabel(number: Int){
        if(controller.reset == true){
            controller.reset = false
            numOfLabel = "0"
        }
        if(numOfLabel == "0"){
            numOfLabel = String(number)
        }else{
            numOfLabel += String(number)
        }
    }
}

