//
//  ViewController.m
//  Day 2 Like
//
//  Created by Grant Timmerman on 8/10/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

    @property int likes;

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];

    // Likes label
    _likes = 0;
    [_likesLabel setFont: [UIFont systemFontOfSize:150]];
    [_likesLabel setTextColor:[UIColor whiteColor]];
    [self updateLikes];
    
    // Likes Title
    [_likesTitle setTextColor:[UIColor whiteColor]];
    
    // Like Button
    [_likeButton.titleLabel setFont: [UIFont systemFontOfSize:20]];
    
    // Background
    CGFloat r = 231;
    CGFloat g = 76;
    CGFloat b = 60;
    self.view.backgroundColor = [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:255.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handleButtonClick:(id)sender {
    ++_likes;
    [self updateLikes];
}

- (void)updateLikes {
    _likesLabel.text = [@(_likes) stringValue];
}

@end
