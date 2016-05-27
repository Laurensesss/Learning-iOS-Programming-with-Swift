//
//  MainViewController.swift
//  UnitConverter
//
//  Created by 石韬 on 16/5/27.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
  // MARK: - Properties
  @IBOutlet private weak var temperatureLabel: UILabel!
  @IBOutlet private weak var temperaturePickerView: UIPickerView!
  private var converter = UnitConverter()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Do any additional setup after loading the view.
    let defaultPickerRow = temperaturePickerView.numberOfRowsInComponent(0) / 2
    temperaturePickerView.selectRow(defaultPickerRow, inComponent: 0, animated: false)
    pickerView(temperaturePickerView, didSelectRow: defaultPickerRow, inComponent: 0)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  // MARK: - DataSource
  func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
    return 1
  }
  
  func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    return converter.temperatureValues.count
  }
  
  
  func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    return "\(converter.temperatureValues[row])°C"
  }
  
  func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    temperatureLabel.text = "\(converter.degreesFarenheit(converter.temperatureValues[row]))°F"
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
