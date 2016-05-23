//
//  RestaurantDetailViewController.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/23.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController {
  
  @IBOutlet var labelStyles: [UILabel]!
  @IBOutlet weak var restaurantName: UILabel!
  @IBOutlet weak var restaurantType: UILabel!
  @IBOutlet weak var restaurantLocation: UILabel!
  @IBOutlet weak var restaurantImageView: UIImageView!
  var restaurant: Restaurant!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    restaurantImageView.image = UIImage(named: restaurant.image)
    restaurantName.text = restaurant.name
    restaurantType.text = restaurant.type
    restaurantLocation.text = restaurant.location
    
    for labelStyle in labelStyles {
      labelStyle.layer.backgroundColor = UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 0.6).CGColor
      labelStyle.layer.cornerRadius = 2
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
