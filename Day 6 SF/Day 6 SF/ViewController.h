//
//  ViewController.h
//  Day 6 SF
//
//  Created by Grant Timmerman on 8/14/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<CLLocationManagerDelegate>

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong) IBOutlet UILabel *distanceLabel;
@property (nonatomic, strong) IBOutlet UILabel *directionLabel;

@property (nonatomic, strong) CLLocationManager *locationManager;

@end