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
    
    mutating func equal(num1: Int)
    {
        numOfSum = Double(num1)
    }
    mutating func addition(num1: Int,num2: Int)
    {
        numOfSum = Double(num1 + num2)
    }
    mutating func subtraction(num1: Int,num2: Int)
    {
        numOfSum = Double(num1 - num2)
    }
    mutating func multiplication(num1: Int,num2: Int)
    {
        numOfSum = Double(num1 * num2)
    }
    mutating func division(num1: Int,num2: Int)
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

