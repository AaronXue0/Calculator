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
    
    @IBOutlet weak var outlet: UILabel!
    @IBOutlet weak var calculatorResult: UILabel!
    
    var numOfLabel = "0" {
        didSet {
            outlet.text = "\(numOfLabel)"
        }
    }
    
    var procceeding = "" {
        didSet {
            calculatorResult.text = "\(procceeding)"
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
            changeDisplayOfResult(text: String(txtNumber))
        }
    }
    
    @IBAction func touchPoit(_ sender: Any) {
        if(pin == 2) {
            return
        }
        
        procceeding = procceeding + "."
        
        pin = 2
    }
    
    @IBOutlet var opeatorButton: [UIButton]!
    
    @IBAction func touchOperator(_ sender: UIButton) {
        controller.reset = true
        controller.recordNumber = Double(Int(numOfLabel)!)
        if let opCode = opeatorButton.firstIndex(of: sender){
            opCodeRecord = opCode
            
            if(opCodeRecord != 4 && pin == 1){
                procceeding.removeLast()
            }
            pin = 1
            switch opCodeRecord {
            case 0:
                opCodeRecordArray.append("+")
                procceeding = procceeding + "+"
            case 1:
                opCodeRecordArray.append("-")
                procceeding = procceeding + "-"
            case 2:
                opCodeRecordArray.append("*")
                procceeding = procceeding + "*"
            case 3:
                opCodeRecordArray.append("/")
                procceeding = procceeding + "/"
            case 4:
                opCodeRecord = -1
                procceeding = procceeding + "="
                calculate()
            default:
                return;
            }
        }
    }

    func calculate(){
        
        controller.cal(result: procceeding, opRecord: opCodeRecordArray)
        
        changeDisplayOfLabel(number: controller.numOfSum)
    }
    
        
    func changeDisplayOfResult(text: String){
        procceeding = (procceeding == "0") ?
            text :
            procceeding + text
    }
    
    func changeDisplayOfLabel(number: Double){
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
    
    
    @IBAction func AC(_ sender: UIButton) {
        resetCal()
    }
    
    func resetCal(){
        clearStorages()
    }
    
    func clearDisplay(){
        controller.reset = true
        changeDisplayOfResult(text: "")
        changeDisplayOfLabel(number: 0)
    }
    
    func clearStorages(){
        pin = 0
        opCodeRecord = 4
        controller.numOfSum = 0
        controller.recordNumber = 0
        opCodeRecordArray = [String]()
    }
}

