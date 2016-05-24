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
  var isPaused: Bool = false
  
//  var elapsedTime: NSTimeInterval {
//    if let startTime = self.startTime {
//      return -startTime.timeIntervalSinceNow
//    }
//    else{
//      return 0
//    }
//  }
  
  func elapsedTime(timeInterval: NSTimeInterval) -> NSTimeInterval {
    if let startTime = self.startTime {
      return -startTime.timeIntervalSinceNow + timeInterval
    }
    else {
      return 0
    }
  }
  
  func elapsedTimeAsString(timeInterval: NSTimeInterval) -> String {
      return String(format: "%02d:%02d.%d", Int((self.elapsedTime(timeInterval)) / 60), Int((self.elapsedTime(timeInterval)) % 60), Int((self.elapsedTime(timeInterval)) * 10 % 10))
  }
  
  // MARK: - Methods
  func start() {
    self.startTime = NSDate()
    isRunning = true
    isPaused = false
  }
  
  func stop() {
    
    isRunning = false
    isPaused = false
    self.startTime = nil
  }
  
  func pause() {
    
    isRunning = false
    isPaused = true
    self.startTime = nil
  }
  
  func resume() {
    self.startTime = NSDate()
    isRunning = true
    isPaused = false
  }
}