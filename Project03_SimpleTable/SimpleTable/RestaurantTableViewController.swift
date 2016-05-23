//
//  RestaurantTableViewController.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/21.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
  
  // MARK: - Properties
  var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "Thai Cafe"]
  var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]
  var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
  var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
  var restaurantIsVisited = [Bool](count: 21, repeatedValue: false)
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Uncomment the following line to preserve selection between presentations
    //     self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    //     self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return restaurantNames.count
  }
  
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellIdentifier = "Cell"
    let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! RestaurantTableViewCell
    
    // Configure the cell...
    cell.nameLabel.text = restaurantNames[indexPath.row]
    cell.thumbnailImageView.image = UIImage(named: restaurantImages[indexPath.row])
    cell.locationLabel.text = restaurantLocations[indexPath.row]
    cell.typeLabel.text = restaurantTypes[indexPath.row]
    
    
    //        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.bounds.height / 2
    //        cell.thumbnailImageView.clipsToBounds = true
    cell.thumbnailImageView.layer.borderWidth = 3
    cell.thumbnailImageView.layer.borderColor = UIColor.orangeColor().CGColor
    
    cell.accessoryType = self.restaurantIsVisited[indexPath.row] ? .Checkmark : .None
    return cell
    
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    // Create an option menu as an action sheet.
    let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .ActionSheet)
    
    // Add actions to the menu.
    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
    
    let callActionHandler = { (action: UIAlertAction!) -> Void in
      let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry, the call feature is not available yet. Please retry later.", preferredStyle: .Alert)
      alertMessage.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
      self.presentViewController(alertMessage, animated: true, completion: nil)
      
    }
    
    
    let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .Default, handler: callActionHandler)
    
    
    let isVisitedAction = UIAlertAction(title: "I've been here", style: .Default, handler: { (_) in
      let cell = tableView.cellForRowAtIndexPath(indexPath)
      cell?.accessoryType = .Checkmark
      self.restaurantIsVisited[indexPath.row] = true
    })
    
    
    let isNotVisitedAction = UIAlertAction(title: "I've not been here", style: .Default) { (_) in
      let cell = tableView.cellForRowAtIndexPath(indexPath)
      cell?.accessoryType = .None
      self.restaurantIsVisited[indexPath.row] = false
    }
    
    let visitedAction = self.restaurantIsVisited[indexPath.row] ? isNotVisitedAction : isVisitedAction
    
    optionMenu.addAction(callAction)
    optionMenu.addAction(visitedAction)
    optionMenu.addAction(cancelAction)
    self.presentViewController(optionMenu, animated: true, completion: nil)
    
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the specified item to be editable.
  return true
  }
  */
  
  override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
    // Social Sharing Button
    let shareAction = UITableViewRowAction(style: .Normal, title: "Share") { (_, indexPath) in
      let defaultText = "Just checking in at" + self.restaurantNames[indexPath.row]
      if let imageToShare = UIImage(named: self.restaurantImages[indexPath.row]) {
        let activityController = UIActivityViewController(activityItems: [defaultText, imageToShare], applicationActivities: nil)
        self.presentViewController(activityController, animated: true, completion: nil)
      }
    }
    
    // Delete Button
    let deleteAction = UITableViewRowAction(style: .Default, title: "Delete") { (_, indexPath) in
      // Delete the row from data source.
      self.restaurantNames.removeAtIndex(indexPath.row)
      self.restaurantTypes.removeAtIndex(indexPath.row)
      self.restaurantLocations.removeAtIndex(indexPath.row)
      self.restaurantImages.removeAtIndex(indexPath.row)
      self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    }
    
    shareAction.backgroundColor = UIColor(red: 28.0/255.0, green: 165.0/255.0, blue: 253.0/255.0, alpha: 1.0)
    deleteAction.backgroundColor = UIColor(red: 242/255, green: 38/255.0, blue: 19/255.0, alpha: 1.0)
    
    
    return [deleteAction, shareAction]
    
  }
  
//  // Override to support editing the table view.
//  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
//    if editingStyle == .Delete {
//      // Delete the row from the data source
//      
//      restaurantNames.removeAtIndex(indexPath.row)
//      restaurantImages.removeAtIndex(indexPath.row)
//      restaurantLocations.removeAtIndex(indexPath.row)
//      restaurantTypes.removeAtIndex(indexPath.row)
//      restaurantIsVisited.removeAtIndex(indexPath.row)
//    }
//    
//    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    //    tableView.reloadData()
    
//  }
  
  /*
  // Override to support rearranging the table view.
  override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
  
  }
  */
  
  /*
  // Override to support conditional rearranging of the table view.
  override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the item to be re-orderable.
  return true
  }
  */
  
  /*
  // MARK: - Navigation
  
  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
  // Get the new view controller using segue.destinationViewController.
  // Pass the selected object to the new view controller.
  }
  */
  
}
