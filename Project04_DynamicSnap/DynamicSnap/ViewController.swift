//
//  ViewController.swift
//  DynamicSnap
//
//  Created by 石韬 on 16/4/8.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    var dynamicAnimator:UIDynamicAnimator?
    var snap:UISnapBehavior?
    
    @IBAction func taped(sender: UITapGestureRecognizer) {
        //获得点击位置
        let tap = sender
        let point = tap.locationInView(self.view)
        
        //删除之前的吸附，并创建一个新的
        if let _ = self.snap{
            self.dynamicAnimator?.removeBehavior(self.snap!)
            self.snap = UISnapBehavior(item: self.imageView, snapToPoint: point)
            self.dynamicAnimator?.addBehavior(self.snap!)
        }else{
            self.snap = UISnapBehavior(item: self.imageView, snapToPoint: point)
            self.dynamicAnimator?.addBehavior(self.snap!)
        }
    }
//    @IBAction func tapped(sender: AnyObject) {
//        //获得点击位置
//        let tap = sender as! UITapGestureRecognizer
//        let point = tap.locationInView(self.view)
//        
//        //删除之前的吸附，并创建一个新的
//        if let x = self.snap{
//        self.dynamicAnimator?.removeBehavior(self.snap!)
//        self.snap = UISnapBehavior(item: self.imageView, snapToPoint: point)
//        self.dynamicAnimator?.addBehavior(self.snap!)
//        }else{
//            self.snap = UISnapBehavior(item: self.imageView, snapToPoint: point)
//            self.dynamicAnimator?.addBehavior(self.snap!)
//        }
//    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dynamicAnimator = UIDynamicAnimator(referenceView: self.view)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

