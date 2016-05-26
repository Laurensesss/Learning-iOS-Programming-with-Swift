//
//  ReviewViewController.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/25.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
  @IBOutlet weak var dislikeButton: UIButton!
  @IBOutlet weak var goodButton: UIButton!
  @IBOutlet weak var greatButton: UIButton!
  
  @IBOutlet var backgroundImageView: UIImageView!
  @IBOutlet var ratingStackView: UIStackView!
  var label: UILabel!
  var rating: String?
  
  
  @IBAction func ratingSelected(sender: UIButton) {
    switch sender.tag {
    case 100: rating = "dislike"
    case 200: rating = "good"
    case 300: rating = "great"
    default: break
    }
    
    performSegueWithIdentifier("unwindToDetailView", sender: sender)
  }
  
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
    //    ratingStackView.transform = CGAffineTransformMakeTranslation(0, 500)
    
    // Set two transforms together.
    //    let scale = CGAffineTransformMakeScale(0, 0)
    //    let translate = CGAffineTransformMakeTranslation(0, 500)
    //    ratingStackView.transform = CGAffineTransformConcat(scale, translate)
    dislikeButton.transform = CGAffineTransformMakeTranslation(0, 500)
    goodButton.transform = CGAffineTransformMakeTranslation(0, 500)
    greatButton.transform = CGAffineTransformMakeTranslation(0, 500)
    
    createLabel()
  }
  
  
  func createLabel(){
    label = UILabel(frame: CGRect(x: 130, y: 400, width: 100, height: 50))
    label.text = "CHOOSE ONE!"
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
  
  
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(true)
    //Create the animation of the ratingStackView.
    //    UIView.animateWithDuration(0.6, delay: 0, options: [], animations: {
    //      self.ratingStackView.transform = CGAffineTransformIdentity
    //      }) { (_) in
    //        self.view.addSubview(self.label)
    //    }
    
    // Create spring animation of the ratingStackView.
    UIView.animateWithDuration(0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [], animations: {
      self.dislikeButton.transform = CGAffineTransformIdentity
      }) { (_) in
        
    }
    
    
    UIView.animateWithDuration(0.7, delay: 0.15, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [], animations: {
      self.goodButton.transform = CGAffineTransformIdentity
      }, completion: { (_)in
      })
    
    UIView.animateWithDuration(0.7, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: [], animations: { () -> Void in
      self.greatButton.transform = CGAffineTransformIdentity
      
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
