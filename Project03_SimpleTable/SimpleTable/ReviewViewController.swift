//
//  ReviewViewController.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/25.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
  
  @IBOutlet var backgroundImageView: UIImageView!
  @IBOutlet var ratingStackView: UIStackView!
  var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    
    // Set the background image to a dark blur mode.
    let blurEffect = UIBlurEffect(style: .Dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    backgroundImageView.addSubview(blurEffectView)
    
    // Set the stackView's transform to zero.
//    ratingStackView.transform = CGAffineTransformMakeScale(0, 0)
    
    // Set the stackView out of the screen.
    ratingStackView.transform = CGAffineTransformMakeTranslation(0, 500)
    
    // Set two transforms together.
    let scale = CGAffineTransformMakeScale(0, 0)
    let translate = CGAffineTransformMakeTranslation(0, 500)
    ratingStackView.transform = CGAffineTransformConcat(scale, translate)
    
    createLabel()
  }
  
  
  func createLabel(){
    label = UILabel(frame: CGRect(x: 150, y: 400, width: 50, height: 30))
    label.text = "AHA!"
    label.layer.backgroundColor = UIColor.orangeColor().CGColor
    label.layer.borderWidth = 3
    label.layer.borderColor = UIColor.orangeColor().CGColor
    label.layer.cornerRadius = 5
    label.textAlignment = .Center
    label.textColor = UIColor.whiteColor()
  }
  
  override func prefersStatusBarHidden() -> Bool {
    return true
  }
  
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    //Create the animation of the ratingStackView.
//    UIView.animateWithDuration(0.6, delay: 0, options: [], animations: {
//      self.ratingStackView.transform = CGAffineTransformIdentity
//      }) { (_) in
//        self.view.addSubview(self.label)
//    }
    
    // Create spring animation of the ratingStackView.
    UIView.animateWithDuration(1, delay: 0, usingSpringWithDamping: 0.75, initialSpringVelocity: 0.2, options: [], animations: {
        self.ratingStackView.transform = CGAffineTransformIdentity
      }) { (_) in
        self.view.addSubview(self.label)
    }
    
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
