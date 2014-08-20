//
//  ViewController.m
//  Day 12 White
//
//  Created by Grant Timmerman on 8/23/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UISwitch *lightSwitch;
UIColor *backgroundColor;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add UISwitch
    float x = self.view.frame.size.width/2 - 20;
    float y = self.view.frame.size.height/2;
    lightSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(x, y, self.view.frame.size.width, 0)];
    [lightSwitch addTarget:self action:@selector(flip:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:lightSwitch];
    
    // Setup background
    float r = 253;
    float g = 140;
    float b = 37;
    backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)flip:(id)sender {
    if (lightSwitch.on) {
        [self.view setBackgroundColor:[UIColor whiteColor]];
    } else {
        [self.view setBackgroundColor:backgroundColor];
    }
}

@end
