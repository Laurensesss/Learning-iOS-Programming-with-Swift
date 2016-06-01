//
//  MapViewController.swift
//  SimpleTable
//
//  Created by 石韬 on 16/5/26.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {
  @IBOutlet var mapView:MKMapView!
  
  var restaurant:Restaurant!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Convert address to coordinate and annotate it on map
    let geoCoder = CLGeocoder()
    geoCoder.geocodeAddressString(restaurant.location, completionHandler: { placemarks, error in
      if error != nil {
        print(error)
        return
      }
      
      if let placemarks = placemarks {
        // Get the first placemark
        let placemark = placemarks[0]
        
        // Add annotation
        let annotation = MKPointAnnotation()
        annotation.title = self.restaurant.name
        annotation.subtitle = self.restaurant.type
        
        if let location = placemark.location {
          annotation.coordinate = location.coordinate
          
          // Display the annotation
          self.mapView.showAnnotations([annotation], animated: true)
          self.mapView.selectAnnotation(annotation, animated: true)
        }
      }
      
    })
    
    // Map customization
    mapView.showsCompass = true
    mapView.showsScale = true
    mapView.showsTraffic = true
    
    // Set the MKMapViewDelegate
    mapView.delegate = self
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - MKMapViewDelegate methods
  
  func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
    let identifier = "MyPin"
    
    if annotation.isKindOfClass(MKUserLocation) {
      return nil
    }
    
    // Reuse the annotation if possible
    var annotationView:MKPinAnnotationView? = mapView.dequeueReusableAnnotationViewWithIdentifier(identifier) as? MKPinAnnotationView
    
    if annotationView == nil {
      annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
      annotationView?.canShowCallout = true
    }
    
    let leftIconView = UIImageView(frame: CGRectMake(0, 0, 53, 53))
    leftIconView.image = UIImage(named: restaurant.image)
    annotationView?.leftCalloutAccessoryView = leftIconView
    
    // Pin color customization
    annotationView?.pinTintColor = UIColor.orangeColor()
    
    return annotationView
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
