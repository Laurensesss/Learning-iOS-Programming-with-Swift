//
//  ViewController.swift
//  EasyBrowser
//
//  Created by 石韬 on 16/6/1.
//  Copyright © 2016年 石韬. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
//    @IBAction private func openPage(sender: UIButton) {
//        if let url = NSURL(string: "http://developer.apple.com") {
//            //open in safari.
//     UIApplication.sharedApplication().openURL(url)
//            
//            //open in web view.
//            let request = NSURLRequest(URL: url)
//            webView.loadRequest(request)
//        }
//    }
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if let url = NSURL(string: textField.text!) {
            let fullUrl = NSURL(string: "http://\(String(url))")
            webView.loadRequest(NSURLRequest(URL: fullUrl!))
        }
        return true
    }
    @IBOutlet private weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

