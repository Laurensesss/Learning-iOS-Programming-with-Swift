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
  private var startTime: NSDate?
  
  var isRunning: Bool {
    return startTime != nil
  }
  
  private var elapsedTime: NSTimeInterval {
    if let startTime = self.startTime {
      return -startTime.timeIntervalSinceNow
    }
    else{
      return 0
    }
  }
  
  var elapsedTimeAsString: String {
    if isRunning {
      return String(format: "%02d:%02d.%d", Int(self.elapsedTime / 60), Int(self.elapsedTime % 60), Int(self.elapsedTime * 10 % 10))
    }
    else{
      return "0"
    }
  }
  
  // MARK: - Methods
  func start() {
    self.startTime = NSDate()
  }
  
  func stop() {
    self.startTime = nil
  }
  
  func pause() {
    
  }
  
  func resume() {
    
  }
}