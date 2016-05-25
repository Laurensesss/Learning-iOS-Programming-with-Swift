//
//  RestaurantDetailViewController.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/23.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
  @IBOutlet weak var tableView: UITableView!
  //  @IBOutlet var labelStyles: [UILabel]!
  //  @IBOutlet weak var restaurantName: UILabel!
  //  @IBOutlet weak var restaurantType: UILabel!
  //  @IBOutlet weak var restaurantLocation: UILabel!
  @IBOutlet weak var restaurantImageView: UIImageView!
  @IBOutlet var ratingButton: UIButton!
  
  var phoneNumber = ""
  var restaurant: Restaurant!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    restaurantImageView.image = UIImage(named: restaurant.image)
    //    restaurantName.text = restaurant.name
    //    restaurantType.text = restaurant.type
    //    restaurantLocation.text = restaurant.location
    
    //    for labelStyle in labelStyles {
    //      labelStyle.layer.backgroundColor = UIColor(red: 52/255, green: 73/255, blue: 94/255, alpha: 0.6).CGColor
    //      labelStyle.layer.cornerRadius = 2
    //    }
    
    tableView.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.8)
    
    
    title = restaurant.name
    
    tableView.estimatedRowHeight = 36.0
    tableView.rowHeight = UITableViewAutomaticDimension
  }
  
  override func viewWillAppear(animated: Bool) {
    super.viewWillAppear(true)
    
    navigationController?.hidesBarsOnSwipe = false
    navigationController?.setNavigationBarHidden(false, animated: true)
  }
  
  
  func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }
  
  func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! RestaurantDetailTableViewCell
    
    // Configure the cell...
    switch indexPath.row {
    case 0:
      cell.fieldLabel.text = "Name"
      cell.valueLabel.text = restaurant.name
    case 1:
      cell.fieldLabel.text = "Type"
      cell.valueLabel.text = restaurant.type
    case 2:
      cell.fieldLabel.text = "Location"
      cell.valueLabel.text = restaurant.location
    case 3:
      cell.fieldLabel.text = "Phone"
      cell.valueLabel.text = "+86" + phoneNumber
    case 4:
      cell.fieldLabel.text = "Been here"
      cell.valueLabel.text = restaurant.isVisited ? "Yes, I've been here before" : "NO"
    default:
      cell.fieldLabel.text = ""
      cell.valueLabel.text = ""
    }
    
    cell.backgroundColor = UIColor.clearColor()
    
    return cell
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  @IBAction func close(segue: UIStoryboardSegue) {
    if let reviewViewController = segue.sourceViewController as? ReviewViewController {
      if let rating = reviewViewController.rating {
        ratingButton.setImage(UIImage(named: rating), forState: UIControlState.Normal)
      }
    }
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
