//
//  ViewController.m
//  Day 3 Alert
//
//  Created by Grant Timmerman on 8/11/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

int numLaunches;
int numCancels;
bool lastLaunchCancelled;
static NSArray *cancelStrings;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    numLaunches = 0;
    numCancels = 0;
    lastLaunchCancelled = false;
    cancelStrings = [NSArray arrayWithObjects:
        @"Please launch the missles?",
        @"Really, launch the missles already!",
        @"I'm serious, launch the missles.",
        @"Gahhhhhhhh",
        @"LAUNCH THE MISSLES, DAMMIT!",
        nil
    ];

    // Background
    CGFloat r = 221;
    CGFloat g = 86;
    CGFloat b = 70;
    UIColor *bgColor = [UIColor colorWithRed:(r/255) green:(g/255) blue:(b/255) alpha:255];
    self.view.backgroundColor = bgColor;
    
    // Launch button
    _launchButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    _launchButton.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _launchButton.titleLabel.font = [UIFont systemFontOfSize:20];
    [_launchButton setTitle:@"Launch the missles!" forState:UIControlStateNormal];
    [_launchButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_launchButton setExclusiveTouch:YES];
    [_launchButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_launchButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClick:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Wait" message:@"Are you sure you want to launch the missles?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"YES!", nil];
    [alert show];
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *newTitle;
    if (buttonIndex == 1) {
        // confirm
        ++numLaunches;
        if (lastLaunchCancelled) {
            newTitle = @"Thank you!";
        } else {
            newTitle = @"Launch the missles (again)!";
        }
    } else if (buttonIndex == 0) {
        // cancel
        int cancelIndex = MIN(numCancels, [cancelStrings count] - 1);
        ++numCancels;
        newTitle = cancelStrings[cancelIndex];
    }
    lastLaunchCancelled = (buttonIndex == 0);
    [_launchButton setTitle:newTitle forState:UIControlStateNormal];
}

@end
