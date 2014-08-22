//
//  ViewController.m
//  Day 14 Battery
//
//  Created by Grant Timmerman on 8/24/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UILabel *batteryLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup battery label
    batteryLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [batteryLabel setTextAlignment:NSTextAlignmentCenter];
    [self.view addSubview:batteryLabel];
    [self updateBatteryDisplay];
    
    // Setup battery notification system
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(batteryLevelUpdate:) name:UIDeviceBatteryLevelDidChangeNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)batteryLevelUpdate:(NSNotification *)notification {
    // do whatever, using: [[UIDevice currentDevice] batteryLevel]
}

- (void)updateBatteryDisplay {
    float batteryLevel = [[UIDevice currentDevice] batteryLevel];
    [batteryLabel setText:[NSString stringWithFormat:@"%.02f", batteryLevel]];
}

@end
