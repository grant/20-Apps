//
//  ViewController.m
//  Day 4 Clock
//
//  Created by Grant Timmerman on 8/12/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set background
    float r = 252;
    float b = 42;
    float g = 29;
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
    
    // Setup label
    [_timeLabel setFont:[UIFont systemFontOfSize:100]];
    
    NSDate *date = [NSDate date];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    NSString *localeFormatString = [NSDateFormatter dateFormatFromTemplate:@"hh:mm:ss" options:0 locale:dateFormatter.locale];
    [dateFormatter setDateFormat:localeFormatString];
    NSString *localizedString = [dateFormatter stringFromDate:date];
    [_timeLabel setText:localizedString];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
