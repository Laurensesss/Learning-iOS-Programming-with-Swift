//
//  Restaurant.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/23.
//  Copyright © 2016年 石韬. All rights reserved.
//

import Foundation

class Restaurant {
  var name = ""
  var type = ""
  var location = ""
  var image = ""
  var isVisited = false
  
  init(name: String, type: String, location: String, image: String, isVisited: Bool) {
    self.name = name
    self.image = image
    self.location = location
    self.type = type
    self.isVisited = isVisited
  }
}