//
//  ViewController.m
//  Day 17 Swipe
//
//  Created by Grant Timmerman on 8/25/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Label
    _labelX = 0;
    _labelY = 0;
    _label = [[UILabel alloc] initWithFrame:CGRectMake(_labelX, _labelY, self.view.frame.size.width, self.view.frame.size.height)];
    _label.text = @"Swipe me!";
    _label.textAlignment = NSTextAlignmentCenter;
    _label.font = [UIFont systemFontOfSize:30];
    _label.textColor = [UIColor whiteColor];
    [self.view addSubview:_label];
    
    // Swipe recognizers
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeLeft:)];
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeUp:)];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeRight:)];
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipeDown:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [[self view] addGestureRecognizer:swipeLeft];
    [[self view] addGestureRecognizer:swipeUp];
    [[self view] addGestureRecognizer:swipeRight];
    [[self view] addGestureRecognizer:swipeDown];
    
    // Set background
    CGFloat r = 255;
    CGFloat g = 201;
    CGFloat b = 55;
    self.view.backgroundColor = [UIColor colorWithRed:(r/255) green:(g/255) blue:(b/255) alpha:255];
}

- (IBAction)handleSwipeLeft:(UISwipeGestureRecognizer*)sender {
    NSLog(@"left");
}
- (IBAction)handleSwipeUp:(UISwipeGestureRecognizer*)sender {
    NSLog(@"up");
}
- (IBAction)handleSwipeRight:(UISwipeGestureRecognizer*)sender {
    NSLog(@"right");
}
- (IBAction)handleSwipeDown:(UISwipeGestureRecognizer*)sender {
    NSLog(@"down");
}

- (void)moveLabel:(int)dx dy:(int)dy {
    CGRect frame = _label.frame;
    frame.origin.x = _label.frame.origin.x + dx;
    frame.origin.y = _label.frame.origin.y + dy;
    _label.frame = frame;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
