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

UILabel *batteryPercentageLabel;
UILabel *batteryStateLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup battery label
    // Battery percentage label
    batteryPercentageLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [batteryPercentageLabel setTextAlignment:NSTextAlignmentCenter];
    batteryPercentageLabel.textColor = [UIColor whiteColor];
    batteryPercentageLabel.font = [UIFont systemFontOfSize:50];
    [self.view addSubview:batteryPercentageLabel];
    // Battery state label
    batteryStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 100)];
    [batteryStateLabel setTextAlignment:NSTextAlignmentCenter];
    batteryStateLabel.textColor = [UIColor whiteColor];
    batteryStateLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:batteryStateLabel];
    
    // Setup battery notification system
    [[UIDevice currentDevice] setBatteryMonitoringEnabled:YES];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(batteryLevelUpdate:)
                                                 name:UIDeviceBatteryLevelDidChangeNotification
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(batteryStateDidChange:)
                                                 name:UIDeviceBatteryStateDidChangeNotification
                                               object:nil];
    
    // Update the battery display
    [self updateBatteryDisplay];
    
    // Set background
    CGFloat r = 255;
    CGFloat g = 163;
    CGFloat b = 46;
    self.view.backgroundColor = [UIColor colorWithRed:(r/255) green:(g/255) blue:(b/255) alpha:255];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)batteryLevelUpdate:(NSNotification*)notification {
    [self updateBatteryDisplay];
}

- (void)batteryStateDidChange:(NSNotification*)notification {
    [self updateBatteryDisplay];
}

- (void)updateBatteryDisplay {
    // Battery level
    float batteryLevel = [[UIDevice currentDevice] batteryLevel];
    NSString *batteryText = [NSString stringWithFormat:@"%i%%", (int)(batteryLevel * 100)];
    [batteryPercentageLabel setText:batteryText];
    
    // Battery state
    UIDeviceBatteryState batteryState = [UIDevice currentDevice].batteryState;
    switch (batteryState) {
        case UIDeviceBatteryStateCharging:
            batteryStateLabel.text = @"charging";
            break;
        case UIDeviceBatteryStateFull:
            batteryStateLabel.text = @"charged";
            break;
        case UIDeviceBatteryStateUnplugged:
            batteryStateLabel.text = @"unplugged";
            break;
        case UIDeviceBatteryStateUnknown:
            batteryStateLabel.text = @"unknown";
            break;
    }
}

@end
