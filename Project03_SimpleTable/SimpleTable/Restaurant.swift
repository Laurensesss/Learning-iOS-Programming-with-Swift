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
  var phoneNumber = ""
  var isVisited = false
  var rating = ""
  
  init(name: String, type: String, location: String, phoneNumber: String, image: String, isVisited: Bool) {
    self.name = name
    self.image = image
    self.location = location
    self.type = type
    self.phoneNumber = phoneNumber
    self.isVisited = isVisited
//    self.rating = rating
  }
}