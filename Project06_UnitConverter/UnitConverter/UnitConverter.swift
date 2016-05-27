//
//  UnitConverter.swift
//  UnitConverter
//
//  Created by 石韬 on 16/5/27.
//  Copyright © 2016年 石韬. All rights reserved.
//

import Foundation

class UnitConverter {
  
  var temperatureValues = (-100...100).map{ $0 }

  func degreesFarenheit(degreesCelsius: Int) -> Int {
    return Int(1.8 * Double(degreesCelsius) + 32.0)
  }

}