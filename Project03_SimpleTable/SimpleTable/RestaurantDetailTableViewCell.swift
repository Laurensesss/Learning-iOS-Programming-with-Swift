//
//  RestaurantDetailTableViewCell.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/24.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class RestaurantDetailTableViewCell: UITableViewCell {
  @IBOutlet weak var valueLabel: UILabel!

  @IBOutlet weak var fieldLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
