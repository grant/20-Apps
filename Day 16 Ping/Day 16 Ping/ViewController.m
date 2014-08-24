//
//  ViewController.m
//  Day 16 Ping
//
//  Created by Grant Timmerman on 8/24/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    // Setup background
    float r = 255;
    float g = 188;
    float b = 52;
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
