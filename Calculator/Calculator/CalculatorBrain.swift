//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 石韬 on 16/6/6.
//  Copyright © 2016年 石韬. All rights reserved.
//

import Foundation

class CalculatorBrain {
  
//  var description: String {
//    get {
//      return self.description
//    }
//    set {
//      self.description = String(newValue)
//    }
//  }
//  
//  var isPartialResult: Bool?
  
  private var accumulator = 0.0
  
  private var internalProgram = [AnyObject]()
  
  func setOperand(operand: Double) {
    accumulator = operand
    internalProgram.append(operand)
  }
  
  private var operations: Dictionary<String,Operation> = [
    "π" : Operation.Constant(M_PI),
    "e" : Operation.Constant(M_E),
    "±" : Operation.UnaryOperation({ -$0 }),
    "%" : Operation.UnaryOperation({ 0.01 * $0 }),
    "√" : Operation.UnaryOperation(sqrt),
    "cos" : Operation.UnaryOperation(cos),
    "sin" : Operation.UnaryOperation(sin),
    "×" : Operation.BinaryOperation({ $0 * $1 }),
    "÷" : Operation.BinaryOperation({ $0 / $1 }),
    "+" : Operation.BinaryOperation({ $0 + $1 }),
    "−" : Operation.BinaryOperation({ $0 - $1 }),
    "=" : Operation.Equals
  ]
  
  private enum Operation {
    case Constant(Double)
    case UnaryOperation((Double) -> Double)
    case BinaryOperation((Double, Double) -> Double)
    case Equals
  }
  
  func performOperation(symbol: String) {
    internalProgram.append(symbol)
    
    if let operation = operations[symbol] {
      switch operation {
      case .Constant(let value):
        accumulator = value
      case .UnaryOperation(let function):
        accumulator = function(accumulator)
      case .BinaryOperation(let function):
        executeBinaryOperation()
        pending = PendingBinaryOperationInfo(bianryFunction: function, firstOperand: accumulator)
      case .Equals:
       executeBinaryOperation()
        pending = nil
      }
    }
  }
  
  private func executeBinaryOperation() {
    if pending != nil {
      accumulator  = pending!.bianryFunction(pending!.firstOperand, accumulator)
    }
  }
  
  private var pending: PendingBinaryOperationInfo?
  
  private struct PendingBinaryOperationInfo {
    var bianryFunction: (Double ,Double) -> Double
    var firstOperand: Double
  }
  
  typealias PropertyList = AnyObject
  
  var program: PropertyList {
    get {
      return internalProgram
    }
    set {
      clear()
      if let arrayOfOps = newValue as? [AnyObject] {
        for op in arrayOfOps {
          if let operand = op as? Double {
            setOperand(operand)
          } else if let operation = op as? String {
            performOperation(operation)
          }
        }
      }
    }
  }
  
  func clear() {
    accumulator = 0
    pending = nil
    internalProgram.removeAll()
  }
 
  var result: Double {
    return accumulator
  }
  
  
}









