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
    var operation: Double
    var numOfSum: Double
    
    mutating func addition(num1: Int,num2: Int)
    {
        numOfSum = Double(num1 + num2)
    }
    
    init(){
        reset = false
        recordNumber = 0
        operation = 0
        numOfSum = 0
    }
}

