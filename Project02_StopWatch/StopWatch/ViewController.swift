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
  
  var buttonColor = (orange: UIColor.orangeColor().CGColor, gray: UIColor.darkGrayColor().CGColor)
  
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
    setButtonStyle()
  }
  
  @IBAction func stopButtonTapped(sender: UIButton) {
    stopWatch.stop()
    setButtonStyle()
  }
  
  @IBAction func pauseButtonTapped(sender: UIButton) {
    stopWatch.pause()
    setButtonStyle()
  }
  @IBAction func resumeButtonTapped(sender: UIButton) {
    if stopWatch.startTime != nil{
      stopWatch.resume()
      NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "updateElapsedTimeLabel:", userInfo: nil, repeats: true)
    }
    else{
      return
    }
    setButtonStyle()
  }
  @IBAction func returnButtonTapped(sender: UIButton) {
    stopWatch.stop()
    elapsedTimeLabel.text = "00:00.0"
    setButtonStyle()
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Set the buttons' style.
    for orangeButton in orangeButtons {
      orangeButton.layer.cornerRadius = 5
    }
    
    setButtonStyle()
  }
  
  
  func setButtonStyle() {
    for orangeButton in orangeButtons{
      switch (stopWatch.startTime, stopWatch.isRunning) {
      case (nil, false):
        
        switch orangeButton.currentTitle! {
        case "Start": orangeButton.enabled = true
        orangeButton.layer.backgroundColor = buttonColor.orange
        case "Stop": orangeButton.enabled = false
        orangeButton.layer.backgroundColor = buttonColor.gray
        case "Pause": orangeButton.enabled = false
        orangeButton.layer.backgroundColor = buttonColor.gray
        case "Resume": orangeButton.enabled = false
        orangeButton.layer.backgroundColor = buttonColor.gray
        default: break
        }
        
      case (_,true):
        
        switch orangeButton.currentTitle! {
        case "Start": orangeButton.enabled = false
        orangeButton.layer.backgroundColor = buttonColor.gray
        case "Stop": orangeButton.enabled = true
        orangeButton.layer.backgroundColor = buttonColor.orange
        case "Pause": orangeButton.enabled = true
        orangeButton.layer.backgroundColor = buttonColor.orange
        case "Resume": orangeButton.enabled = false
        orangeButton.layer.backgroundColor = buttonColor.gray
        default: break
        }
        
      case (_,false):
        
        switch orangeButton.currentTitle! {
        case "Start": orangeButton.enabled = false
        orangeButton.layer.backgroundColor = buttonColor.gray
        case "Stop": orangeButton.enabled = false
        orangeButton.layer.backgroundColor = buttonColor.gray
        case "Pause": orangeButton.enabled = false
        orangeButton.layer.backgroundColor = buttonColor.gray
        case "Resume": orangeButton.enabled = true
        orangeButton.layer.backgroundColor = buttonColor.orange
        default: break
        }
      }
    }
  }
  
  
}

