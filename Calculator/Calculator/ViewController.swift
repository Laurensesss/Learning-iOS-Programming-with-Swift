//
//  ViewController.swift
//  Calculator
//
//  Created by 石韬 on 16/6/6.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet var buttonStyle: [UIButton]!
  
  @IBOutlet weak var clearButton: UIButton!
  
  @IBOutlet private weak var display: UILabel!
  
  @IBOutlet weak var dotButton: UIButton!
  
  private var userIsInTheMiddleOfTyping = false
  
  private var displayValue: Double {
    get {
      return Double(display.text!)!
    }
    set {
      display.text = String(newValue)
    }
  }
  
  private var brain = CalculatorBrain()
  
  
  // MARK: - Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dotButton.enabled = false
    
    for button in buttonStyle {
      button.layer.cornerRadius = 5
    }
    
    clearButton.enabled = false
  }
  
  // MARK: - Action Methods
  @IBAction private func touchDigit(sender: UIButton) {
    let digit = sender.currentTitle!
    
    // 点击『.』后，使其不可选
    if sender.currentTitle == "." {
      sender.enabled = false
    }
    
    if userIsInTheMiddleOfTyping {
      let textCurrentlyInDisplay = display.text!
      display.text = textCurrentlyInDisplay + digit
    } else {
      display.text = digit
      dotButton.enabled = true  //当处于不在输入中的状态时，点击一个数字，进入输入状态，并使『.』可选
    }
    userIsInTheMiddleOfTyping = true
  }
  
  @IBAction private func performOperation(sender: UIButton) {
    if userIsInTheMiddleOfTyping {
      brain.setOperand(displayValue)
      userIsInTheMiddleOfTyping = false
      dotButton.enabled = false
    }
    if let mathematicalSymbol = sender.currentTitle {
      brain.performOperation(mathematicalSymbol)
    }
    displayValue = brain.result
  }
  
  @IBAction func clearButtonTapped(sender: UIButton) {
   
  }
  
}
























