//
//  ViewController.swift
//  DynamicGravity
//
//  Created by 石韬 on 16/4/8.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  var dynamicAnimator = UIDynamicAnimator()
  
  @IBAction func buttonTapped(sender: UIButton) {
    dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    //创造并添加重力行为
    let gravityBehavior = UIGravityBehavior(items: [self.imageView])
    dynamicAnimator.addBehavior(gravityBehavior)
    
    //创建并添加碰撞行为
    let collisionBehavior = UICollisionBehavior(items: [self.imageView])
    collisionBehavior.translatesReferenceBoundsIntoBoundary = true
    dynamicAnimator.addBehavior(collisionBehavior)
  }
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
  
}

