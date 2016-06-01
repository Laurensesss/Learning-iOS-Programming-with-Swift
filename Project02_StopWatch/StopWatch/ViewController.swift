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
    var lastTime: NSTimeInterval = 0
    
    var buttonColor = (orange: UIColor.orangeColor().CGColor, gray: UIColor.darkGrayColor().CGColor)
    
    // MARK: - Methods
    func updateElapsedTimeLabel(timer: NSTimer?) {
        if stopWatch.isRunning {
            elapsedTimeLabel.text = stopWatch.elapsedTimeAsString(lastTime)
        }
        else {
            timer?.invalidate()
        }
    }
    
    @IBAction func startButtonTapped(sender: UIButton) {
        elapsedTimeLabel.text = "00:00.0"
        //      String(format: "%02d:%02d.%d", Int(lastTime / 60), Int(lastTime % 60), Int(lastTime * 10 % 10))
        stopWatch.start()
        
        //    elapsedTimeLabel.text = stopWatch.elapsedTimeAsString(lastTime)
        NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "updateElapsedTimeLabel:", userInfo: nil, repeats: true)
        setButtonStyle()
    }
    
    @IBAction func stopButtonTapped(sender: UIButton) {
        lastTime = 0
        stopWatch.stop()
        setButtonStyle()
    }
    
    @IBAction func pauseButtonTapped(sender: UIButton) {
        lastTime = stopWatch.elapsedTime(lastTime)
        stopWatch.pause()
        setButtonStyle()
        
    }
    @IBAction func resumeButtonTapped(sender: UIButton) {
        stopWatch.resume()
        //    updateElapsedTimeLabel(nil)
        NSTimer.scheduledTimerWithTimeInterval(0.05, target: self, selector: "updateElapsedTimeLabel:", userInfo: nil, repeats: true)
        
        setButtonStyle()
    }
    @IBAction func returnButtonTapped(sender: UIButton) {
        lastTime = 0
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
    
    
    // Set buttons' style according to different situations.
    func setButtonStyle() {
        for orangeButton in orangeButtons{
            switch (stopWatch.isRunning, stopWatch.isPaused) {
            case (false, false):
                
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
                
            case (true,false):
                
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
                
            case (_,true):
                
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

