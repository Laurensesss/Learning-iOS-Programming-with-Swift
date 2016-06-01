//
//  AddRestaurantController.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/29.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class AddRestaurantController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  
  @IBOutlet var imageView: UIImageView!
  
  @IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var typeTextField: UITextField!
  @IBOutlet weak var locationTextField: UITextField!
  @IBOutlet weak var yesButton: UIButton!
  @IBOutlet weak var noButton: UIButton!
  var isVisited = true
  
  
  
  
  
  @IBAction func toggleBeenHereButton(sender: UIButton) {
    switch sender {
    case yesButton:
      isVisited = true
      yesButton.layer.backgroundColor = UIColor.orangeColor().CGColor
      noButton.layer.backgroundColor = UIColor.lightGrayColor().CGColor
    case noButton:
      isVisited = false
      yesButton.layer.backgroundColor = UIColor.lightGrayColor().CGColor
      noButton.layer.backgroundColor = UIColor.orangeColor().CGColor
    default:break
    }
  }
  
  @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
    if nameTextField.text != "" || typeTextField.text != "" || locationTextField.text != ""{
      print(nameTextField.text)
      print(typeTextField.text)
      print(locationTextField.text)
      dismissViewControllerAnimated(true, completion: nil)
    }
    else{
      let alertController = UIAlertController(title: "Oops", message: "Sorry, you haven't completed your information.", preferredStyle: .Alert)
      let alertAction = UIAlertAction(title: "OK", style: .Cancel, handler: nil)
      alertController.addAction(alertAction)
      
      self.presentViewController(alertController, animated: true, completion: nil)
      
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    if indexPath.row == 0 {
      if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .PhotoLibrary
        
        self.presentViewController(imagePicker, animated: true, completion: nil)
      }
    }
    
    tableView.deselectRowAtIndexPath(indexPath, animated: true)
  }
  
  func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
    imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
    imageView.contentMode = .ScaleAspectFill
    imageView.clipsToBounds = true
    
    // Define constraints.
    let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: .Leading, relatedBy: .Equal, toItem: imageView.superview, attribute: .Leading, multiplier: 1, constant: 0)
    leadingConstraint.active = true
    
    let trailingConstraint = NSLayoutConstraint(item: imageView, attribute: .Trailing, relatedBy: .Equal, toItem: imageView.superview, attribute: .Trailing, multiplier: 1, constant: 0)
    trailingConstraint.active = true
    
    let topConstraint = NSLayoutConstraint(item: imageView, attribute: .Top, relatedBy: .Equal, toItem: imageView.superview, attribute: .Top, multiplier: 1, constant: 0)
    topConstraint.active = true
    
    let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: .Bottom, relatedBy: .Equal, toItem: imageView.superview, attribute: .Bottom, multiplier: 1, constant: 0)
    bottomConstraint.active = true
    
    dismissViewControllerAnimated(true, completion: nil)
  }
  
  
  
  /*
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
  let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
  
  // Configure the cell...
  
  return cell
  }
  */
  
  /*
  // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
  // Return false if you do not want the specified item to be editable.
  return true
  }
  */
  
  /*
  // Override to support editing the table view.
  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
  if editingStyle == .Delete {
  // Delete the row from the data source
  tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
  } else if editingStyle == .Insert {
  // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
  }
  }
  */
  
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
