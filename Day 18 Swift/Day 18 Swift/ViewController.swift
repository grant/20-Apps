//
//  ViewController.swift
//  Day 18 Swift
//
//  Created by Grant Timmerman on 8/26/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var label:UILabel;
    
    required init(coder aDecoder: NSCoder) {
        self.label = UILabel()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setup UILabel
        label.frame = CGRect(x: 0,y: 0,width: self.view.frame.size.width, height: self.view.frame.size.height)
        label.text = "Tap"
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        label.font = UIFont.systemFontOfSize(50)
        self.view.addSubview(label)
        
        // Set background color
        self.view.backgroundColor = UIColor(red: 255/255, green: 214/255, blue: 59/255, alpha: 255)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didTap(sender: UITapGestureRecognizer) {
        println("hi")
    }
}