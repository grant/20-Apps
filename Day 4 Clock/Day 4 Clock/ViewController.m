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

// Base color
float r = 252;
float b = 42;
float g = 29;
float lowAmount = 0.8; // 0-1, the lowest brightness percent

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set background
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
    
    // Setup label
    [_timeLabel setFont:[UIFont systemFontOfSize:50]];
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(update:) userInfo:nil repeats:YES];
    
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
    
    // Set background
    long long millis = [[NSDate date] timeIntervalSince1970] * 1000;
    float brightness = sin(2 * M_PI * (int)millis / 1000.0) * 0.5 + 0.5;
    float newR = (lowAmount * r) + (brightness * (1 - lowAmount) * r);
    float newG = (lowAmount * g) + (brightness * (1 - lowAmount) * g);
    float newB = (lowAmount * b) + (brightness * (1 - lowAmount) * b);
    UIColor *backgroundColor = [UIColor colorWithRed:newR/255 green:newG/255 blue:newB/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
}

@end
