//
//  ViewController.swift
//  Day 18 Swift
//
//  Created by Grant Timmerman on 8/26/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // The number of taps to store in the array
    let numTapsToStore = 3
    
    // Main label
    var label:UILabel;
    // The dates for the last N number of taps
    var tapTimes:[NSDate] = [];
    
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
        addTap()
        updateLabel()
    }
    
    // Adds a tap
    func addTap() {
        tapTimes.append(NSDate())
        if (tapTimes.count > numTapsToStore) {
            tapTimes.removeAtIndex(0)
        }
    }
    
    // Updates the tap label
    func updateLabel() {
        let tapSpeed:Double = getTapSpeed()
        switch tapSpeed {
        case 0...200:
            label.text = "swift!"
        case 201...250:
            label.text = "blazing"
        case 251...300:
            label.text = "fast"
        case 301...350:
            label.text = "medium"
        default:
            label.text = "slow"
        }
    }
    
    // Calculates the tap speed by averaging the last N taps
    func getTapSpeed() -> Double {
        if (tapTimes.count <= 1) {
            return Double.infinity
        } else {
            let firstTime:Double = tapTimes[0].timeIntervalSince1970 * 1000
            let lastTime:Double = tapTimes[tapTimes.count - 1].timeIntervalSince1970 * 1000
            let speed:Double = lastTime - firstTime
            return speed
        }
    }
}