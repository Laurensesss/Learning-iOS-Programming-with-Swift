//
//  StopWatch.swift
//  StopWatch
//
//  Created by 石韬 on 16/5/22.
//  Copyright © 2016年 石韬. All rights reserved.
//

import Foundation

class StopWatch {
  // MARK: - Properties
  var startTime: NSDate?
  
  var isRunning: Bool = false
  
  private var elapsedTime: NSTimeInterval {
    if let startTime = self.startTime {
      return -startTime.timeIntervalSinceNow
    }
    else{
      return 0
    }
  }
  
  var elapsedTimeAsString: String {
    if startTime != nil {
      return String(format: "%02d:%02d.%d", Int(self.elapsedTime / 60), Int(self.elapsedTime % 60), Int(self.elapsedTime * 10 % 10))
    }
    else{
      return "0"
    }
  }
  
  // MARK: - Methods
  func start() {
    self.startTime = NSDate()
    isRunning = true
  }
  
  func stop() {
    self.startTime = nil
    isRunning = false
  }
  
  func pause() {
    isRunning = false
  }
  
  func resume() {
    isRunning = true
  }
}