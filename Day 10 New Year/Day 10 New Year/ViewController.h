//
//  ViewController.h
//  Day 10 New Year
//
//  Created by Grant Timmerman on 8/18/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *animalLabel;
@property (strong, nonatomic) NSArray *years;
@property (strong, nonatomic) NSArray *animals;

@end

