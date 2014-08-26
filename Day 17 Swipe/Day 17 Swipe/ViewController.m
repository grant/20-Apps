//
//  ViewController.m
//  Day 17 Swipe
//
//  Created by Grant Timmerman on 8/25/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Set background
    CGFloat r = 255;
    CGFloat g = 201;
    CGFloat b = 55;
    self.view.backgroundColor = [UIColor colorWithRed:(r/255) green:(g/255) blue:(b/255) alpha:255];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
