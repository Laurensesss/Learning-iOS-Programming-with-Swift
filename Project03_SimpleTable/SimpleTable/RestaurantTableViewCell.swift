//
//  RestaurantTableViewCell.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/21.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
  
  // MARK: - Properties
  @IBOutlet var nameLabel: UILabel!
  @IBOutlet var locationLabel: UILabel!
  @IBOutlet var typeLabel: UILabel!
  @IBOutlet var thumbnailImageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
}
