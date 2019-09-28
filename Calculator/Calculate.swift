//
//  Model.swift
//  Calculator
//
//  Created by Aaron Xue on 2019/9/28.
//  Copyright © 2019 Aaron Xue. All rights reserved.
//

import Foundation

enum Calculation {
    case Addition(Double,Double),
         Subtraction(num1:Double,num2:Double),
         Multiplication(num1:Double,num2:Double),
         Division(num1:Double,num2:Double)
    
    func Calculate() -> Double {
        switch self {
        case let .Addition(number1,number2):
            return number1 + number2
        case let .Subtraction(number1,number2):
            return number1 - number2
        case let .Multiplication(number1,number2):
            return number1 * number2
        case let .Division(number1,number2):
            return number1 / number2
        }
    }
}
