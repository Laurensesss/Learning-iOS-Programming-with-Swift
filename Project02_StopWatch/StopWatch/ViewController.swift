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
  
  @IBOutlet weak var elapsedTimeLabel: UILabel!
  let stopWatch = StopWatch()
  
  
  // MARK: - Methods
  func updateElapsedTimeLabel(timer: NSTimer) {
    if stopWatch.isRunning {
      elapsedTimeLabel.text = stopWatch.elapsedTimeAsString
    }
    else{
      timer.invalidate()
    }
  }
  
  @IBAction func startButtonTapped(sender: UIButton) {
    stopWatch.start()
    NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateElapsedTimeLabel:", userInfo: nil, repeats: true)
  }
  
  @IBAction func stopButtonTapped(sender: UIButton) {
    stopWatch.stop()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the buttons' style.
    for orangeButton in orangeButtons {
      orangeButton.layer.cornerRadius = 5
    }
  }


}

