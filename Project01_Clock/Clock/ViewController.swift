//
//  ViewController.swift
//  Clock
//
//  Created by 石韬 on 16/5/18.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  // MARK: - Properties
  @IBOutlet weak var timeLabel: UILabel!
  let clock = Clock()
  
  
  // MARK: - Methods
  func updateTimeLabel() {
    let formatter = NSDateFormatter()
    formatter.timeStyle = .MediumStyle
    timeLabel.text = formatter.stringFromDate(clock.currentTime)
  }
  
  // MARK: - Life Cycle
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    updateTimeLabel()
    NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTimeLabel", userInfo: nil, repeats: true)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }


}

