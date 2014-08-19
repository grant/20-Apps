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

static NSArray *animals;

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup animals
    animals = [NSArray arrayWithObjects:
               @"Rat",
               @"Ox",
               @"Tiger",
               @"Rabbit",
               @"Dragon",
               @"Snake",
               @"Horse",
               @"Sheep",
               @"Monkey",
               @"Cock",
               @"Dog",
               @"Boar",
               nil];
    
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
    unsigned units = NSYearCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *components = [calendar components:units fromDate:date];
    
    NSInteger year = [components year];
    int yearDifference = ((int)year - 1900) % 12;
    NSString *animal = animals[yearDifference];
    return animal;
}

@end
