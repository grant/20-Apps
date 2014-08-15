//
//  ViewController.m
//  Day 6 SF
//
//  Created by Grant Timmerman on 8/14/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup background
    float r = 252;
    float g = 66;
    float b = 29;
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
    
    // Title label
    CGRect frame = CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.width);
    _directionLabel = [[UILabel alloc] initWithFrame:frame];
    [_directionLabel setText:@"You are"];
    [_directionLabel setTextAlignment:NSTextAlignmentCenter];
    [_directionLabel setTextColor:[UIColor whiteColor]];
    [_directionLabel setFont:[UIFont systemFontOfSize:30]];
    [self.view addSubview:_directionLabel];
    
    // Distance label
    
    // Direction label
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
