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
    
    // Setup animals
    _animals = [NSArray arrayWithObjects:
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
    
    // Setup years
    int numYears = 201;
    int startYear = 1900;
    NSMutableArray *yearsArray = [NSMutableArray arrayWithCapacity:numYears];
    for (int i = 0; i < numYears; ++i) {
        [yearsArray addObject:[NSNumber numberWithInt:(startYear + i)]];
    }
    _years = [NSArray arrayWithArray:yearsArray];
    
    // Setup year picker
    _datePicker.dataSource = self;
    _datePicker.delegate = self;
    NSDate *today = [NSDate date];
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitYear fromDate:today];
    int todayYear = components.year;
    int expectedTodayYearRowIndex = (todayYear - startYear);
    int todayYearRowIndex = MAX(MIN(startYear, expectedTodayYearRowIndex), 0);
    [_datePicker selectRow:todayYearRowIndex inComponent:0 animated:NO];

    // Setup background
    float r = 253;
    float g = 115;
    float b = 34;
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];

    // Update animal label
    [_animalLabel setFont: [UIFont systemFontOfSize:60]];
    [self updateChineseNewYearAnimalLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dateValueChange:(id)sender {
    [self updateChineseNewYearAnimalLabel];
}

// The number of columns of data
- (int)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// The number of rows of data
- (int)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return _years.count;
}

// Setup picker view rows
- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    NSString *year = [[_years objectAtIndex:row] stringValue];
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:year attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
}

// Gets the date from the date picker
- (int)getDatePickerYear {
    int row = [_datePicker selectedRowInComponent:0];
    int date = [_years[row] intValue];
    return date;
}

// Updates the Chinese New Year animal text label
- (void)updateChineseNewYearAnimalLabel {
    [_animalLabel setText:[self yearToChineseNewYearAnimal:[self getDatePickerYear]]];
}

// Gets the Chinese New Year animal corresponding to a date
- (NSString*)yearToChineseNewYearAnimal:(int)year {
    int yearDifference = ((int)year - 1900) % 12;
    NSString *animal = _animals[yearDifference];
    return animal;
}

@end
