//
//  ViewController.m
//  Day 5 Strobe
//
//  Created by Grant Timmerman on 8/13/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
            

@end

@implementation ViewController

float sliderValue = 0.5;
bool lightAvailable;
AVCaptureDevice *light;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Set background
    float r = 252;
    float b = 54;
    float g = 29;
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
    
    // Setup slider
    [_slider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    // Setup strobelight
    [NSTimer scheduledTimerWithTimeInterval:0.02 target:self selector:@selector(strobeUpdate:) userInfo:nil repeats:YES];
    lightAvailable = (NSClassFromString(@"AVCaptureDevice") != nil);
    if (lightAvailable) {
        light = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
        lightAvailable = ([light hasTorch] && [light hasFlash]);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) sliderValueChanged:(UISlider *)sender {
    sliderValue = [sender value];
//    NSLog(@"%@", [NSString stringWithFormat:@"%.2f", [sender value]]);
}

- (void)strobeUpdate:(id)sender {
    if (lightAvailable) {
        if ([self lightIsOn]) {
            [self turnOffLight];
        } else {
            [self turnOnLight];
        }
    }
}

// Turns on the camera light
- (void)turnOnLight {
    [light lockForConfiguration:nil];
    [light setTorchMode:AVCaptureTorchModeOn];
    [light setFlashMode:AVCaptureFlashModeOn];
    [light unlockForConfiguration];
}

// Turns off the camera light
- (void)turnOffLight {
    [light lockForConfiguration:nil];
    [light setTorchMode:AVCaptureTorchModeOff];
    [light setFlashMode:AVCaptureFlashModeOff];
    [light unlockForConfiguration];
}

// Returns true if the light is on
- (bool)lightIsOn {
    return light.torchMode == AVCaptureTorchModeOn;
}

@end
