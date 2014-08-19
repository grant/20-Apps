//
//  ViewController.m
//  Day 10 New Year
//
//  Created by Grant Timmerman on 8/18/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup background
    float r = 253;
    float g = 115;
    float b = 34;
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
    
    // Update animal label
    [self updateChineseNewYearAnimalLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dateValueChange:(id)sender {
    [self updateChineseNewYearAnimalLabel];
}

// Updates the Chinese New Year animal text label
- (void)updateChineseNewYearAnimalLabel {
    [_animalLabel setText:[self dateToChineseNewYearAnimal:_datePicker.date]];
}

// Gets the Chinese New Year animal corresponding to a date
- (NSString*)dateToChineseNewYearAnimal:(NSDate*)date {
    return @"";
}

@end
