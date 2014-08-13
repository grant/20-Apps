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
    [_timeLabel setFont:[UIFont systemFontOfSize:50]];
    [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update:) userInfo:nil repeats:YES];
    
    [self updateTime];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Timer handler
- (void)update:(id)sender {
    [self updateTime];
}

// Updates the UI time
- (void)updateTime {
    NSDate *date = [NSDate date];
    NSString *time = [NSDateFormatter localizedStringFromDate:date dateStyle:NSDateFormatterNoStyle timeStyle:NSDateFormatterMediumStyle];
    [_timeLabel setText:time];
}

@end
