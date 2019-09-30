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
    
    var opCodeRecord = 4
    var pin = 0
    
    @IBOutlet weak var outlet: UILabel!

    var numOfLabel = "0" {
        didSet {
            outlet.text = "\(numOfLabel)"
        }
    }
    
    @IBOutlet var numButtons: [UIButton]!

    @IBAction func touchNum(_ sender: UIButton) {
        pin = 0
        if let txtNumber = numButtons.firstIndex(of: sender){
            changeDisplayOfLabel(number: txtNumber)
        }
    }
    
    @IBOutlet var opeatorButton: [UIButton]!
    
    @IBAction func touchOperator(_ sender: UIButton) {
        controller.reset = true
        controller.recordNumber = Double(Int(numOfLabel)!)
        if pin == 0{
            calculate()
        }
        if let opCode = opeatorButton.firstIndex(of: sender){
            opCodeRecord = opCode
            pin = 1
        }
        numOfLabel = String(Int(controller.numOfSum))
    }

    func calculate(){
        switch opCodeRecord{
        case 0:controller.addition(
            num1: Int(controller.numOfSum),
            num2: Int(controller.recordNumber))
        case 1:controller.subtraction(
            num1: Int(controller.numOfSum),
            num2: Int(controller.recordNumber))
        case 2:controller.multiplication(
            num1: Int(controller.numOfSum),
            num2: Int(controller.recordNumber))
        case 3:controller.division(
            num1: Int(controller.numOfSum),
            num2: Int(controller.recordNumber))
        case 4:controller.equal(num1: Int(controller.recordNumber))
        default:
            numOfLabel = String(Int(controller.recordNumber))
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
    
    
    @IBAction func clear(_ sender: UIButton) {
        opCodeRecord = 4
        pin = 0
        numOfLabel =  "0"
        controller.numOfSum = 0
        controller.recordNumber = 0
    }
}

