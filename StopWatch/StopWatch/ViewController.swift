//
//  ViewController.swift
//  StopWatch
//
//  Created by 石韬 on 16/5/20.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet var orangeButtons: [UIButton]!
  
  
  
  
  // MARK: - Methods
  
  
  
  
  
  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the buttons' style.
    for orangeButton in orangeButtons {
      orangeButton.layer.cornerRadius = 5
    }
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}

