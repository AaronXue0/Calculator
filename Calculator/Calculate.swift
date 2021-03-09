//
//  Model.swift
//  Calculator
//
//  Created by Aaron Xue on 2019/9/28.
//  Copyright © 2019 Aaron Xue. All rights reserved.
//

import Foundation

struct Calculator{
    var reset: Bool
    var recordNumber: Double
    var numOfSum: Double
    
    mutating func cal(result: String, opRecord: [String])
    {
        print(opRecord)
        var array = result.components(separatedBy: ["*","/","+","-","="])
        array.removeLast()
        
        var op = opRecord
        
        while(true){
            var suc = 0
            for (index,item) in op.enumerated() {
                if(item == "+" || item == "-") {
                    continue
                }
                switch item {
                case "*":
                    multiplication(num1: Double(array[index])!, num2: Double(array[index+1])!)
                case "/":
                     division(num1: Double(array[index])!, num2: Double(array[index+1])!)
                default:
                    continue
                }
                
                array[index] = String(numOfSum)
                array.remove(at: index+1)
                op.remove(at: index)
                suc += 1
                break
            }
            if(suc == 0) {
                break
            }
        }
        
        while(true){
            var suc = 0
        for (index,item) in op.enumerated() {
            print(array)
            if(item == "*" || item == "/") {
                continue
            }
            switch item {
            case "+":
                addition(num1: Double(array[index])!, num2: Double(array[index+1])!)
            case "-":
                 subtraction(num1: Double(array[index])!, num2: Double(array[index+1])!)
            default:
                continue
            }
            
            array[index] = String(numOfSum)
            array.remove(at: index+1)
            op.remove(at: index)
            suc += 1
            break
        }
        if(suc == 0) {
            break
        }
    }
    
    }
    
    
    mutating func equal(num1: Double)
    {
        numOfSum = Double(num1)
    }
    mutating func addition(num1: Double,num2: Double)
    {
        numOfSum = Double(num1 + num2)
    }
    mutating func subtraction(num1: Double,num2: Double)
    {
        numOfSum = Double(num1 - num2)
    }
    mutating func multiplication(num1: Double,num2: Double)
    {
        numOfSum = Double(num1 * num2)
    }
    mutating func division(num1: Double,num2: Double)
    {
        if num2 != 0 {
            numOfSum = Double(num1 / num2)
        }
    }
    
    init(){
        reset = false
        recordNumber = 0
        numOfSum = 0
    }
}

