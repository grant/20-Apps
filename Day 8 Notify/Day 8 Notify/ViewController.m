//
//  ViewController.m
//  Day 8 Notify
//
//  Created by Grant Timmerman on 8/16/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"
#import "AudioController.h"

@interface ViewController ()

@property (strong, nonatomic) AudioController *audioController;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.audioController = [[AudioController alloc] init];
    
    // Set background
    CGFloat r = 252;
    CGFloat g = 90;
    CGFloat b = 31;
    self.view.backgroundColor = [UIColor colorWithRed:(r/255) green:(g/255) blue:(b/255) alpha:255];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleNoteClick:(id)sender {
    [self.audioController playSystemSound:@"note"];
}
- (IBAction)handleHillsideClick:(id)sender {
    [self.audioController playSystemSound:@"hillside"];
}
- (IBAction)handleChordClick:(id)sender {
    [self.audioController playSystemSound:@"chord"];
}

@end
