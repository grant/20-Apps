//
//  ViewController.h
//  Day 17 Swipe
//
//  Created by Grant Timmerman on 8/25/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>

@property (strong, nonatomic) UILabel *label;
@property (nonatomic) int labelX;
@property (nonatomic) int labelY;

@end

