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
    
    var pin = 0
    var opCodeRecord = 4
    var opCodeRecordArray = [String]()
    
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var processDisplay: UILabel!
    @IBOutlet weak var acButton: UIButton!
    
    var displayValue = "0" {
        didSet {
            display.text = "\(displayValue)"
        }
    }
    
    var processValue = "" {
        didSet {
            processDisplay.text = "\(processValue)"
            if(processValue == ""){
                acButton.setTitle("AC", for: .normal)
            }else {
                acButton.setTitle("C", for: .normal)
            }
        }
    }
    
    @IBOutlet var numButtons: [UIButton]!
    
    @IBAction func touchNum(_ sender: UIButton) {
        if(opCodeRecord == -1){
            opCodeRecord = 4
            resetCal()
        }
        
        pin = 0
        
        if let txtNumber = numButtons.firstIndex(of: sender){
            displayProcess(value: String(txtNumber))
        }
    }
    
    @IBAction func touchPoit(_ sender: Any) {
        if(pin == 2) {
            return
        }
        
        processValue = processValue + "."
        
        pin = 2
    }
    
    @IBOutlet var opeatorButton: [UIButton]!
    
    @IBAction func touchOperator(_ sender: UIButton) {
        if(processValue == "") {
            return
        }
        if(opCodeRecord == -1){
            return
        }
        
        controller.reset = true
        controller.recordNumber = Double(Int(displayValue)!)
        if let opCode = opeatorButton.firstIndex(of: sender){
            opCodeRecord = opCode
            
            if(opCodeRecord != 4 && pin == 1){
                opCodeRecordArray.removeLast()
                processValue.removeLast()
            }
            pin = 1
            switch opCodeRecord {
            case 0:
                opCodeRecordArray.append("+")
                processValue = processValue + "+"
            case 1:
                opCodeRecordArray.append("-")
                processValue = processValue + "-"
            case 2:
                opCodeRecordArray.append("*")
                processValue = processValue + "*"
            case 3:
                opCodeRecordArray.append("/")
                processValue = processValue + "/"
            case 4:
                calculate()
            default:
                return;
            }
        }
    }
    
    func calculate(){
        controller.cal(result: processValue, opRecord: opCodeRecordArray)
        displayResult(number: controller.numOfSum)
        opCodeRecord = -1
    }
    
    
    func displayProcess(value: String){
        if(value == ""){
            processValue = ""
        }
        else {
            processValue = (processValue == "0") ? value : processValue + value
        }
        
    }
    
    func displayResult(number: Double){
        print(number)
        if(controller.reset == true){
            controller.reset = false
            displayValue = "0"
        }
        if(displayValue == "0"){
            if(floor(number) == number){
                displayValue = String(Int(number))
            } else {
                displayValue = String(number)
            }
        }else{
            displayValue += String(number)
        }
    }
    
    
    @IBAction func AC(_ sender: UIButton) {
        resetCal()
    }
    
    func resetCal(){
        clearStorages()
        clearDisplay()
    }
    
    func clearDisplay(){
        controller.reset = true
        displayProcess(value: "")
        displayResult(number: 0)
    }
    
    func clearStorages(){
        pin = 0
        opCodeRecord = 4
        controller.numOfSum = 0
        controller.recordNumber = 0
        opCodeRecordArray = [String]()
    }
}

