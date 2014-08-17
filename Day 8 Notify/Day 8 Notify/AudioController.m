//
//  AudioController.m
//  Day 8 Notify
//
//  Created by Grant Timmerman on 8/17/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "AudioController.h"
@import AVFoundation;

@interface AudioController () <AVAudioPlayerDelegate>

@property (assign) SystemSoundID noteSound;
@property (assign) SystemSoundID hillsideSound;
@property (assign) SystemSoundID chordSound;

@end

@implementation AudioController

- (instancetype)init {
    self = [super init];
    if (self) {
        [self configureSystemSound];
    }
    return self;
}

- (void)playSystemSound:(NSString*)sound {
    if ([sound isEqual: @"note"]) {
        AudioServicesPlaySystemSound(self.noteSound);
    } else if ([sound isEqual: @"hillside"]) {
        AudioServicesPlaySystemSound(self.hillsideSound);
    } else if ([sound isEqual:@"chord"]) {
        AudioServicesPlaySystemSound(self.chordSound);
    }
}

- (void)configureSystemSound {
    NSArray *soundNames = @[@"note", @"hillside", @"chord"];
    for (NSString *sound in soundNames) {
        NSString *soundPath = [[NSBundle mainBundle] pathForResource:sound ofType:@"wav"];
        NSURL *soundURL = [NSURL fileURLWithPath:soundPath];
        if ([sound isEqual: @"note"]) {
             AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_noteSound);
        } else if ([sound isEqual: @"hillside"]) {
             AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_hillsideSound);
        } else if ([sound isEqual:@"chord"]) {
             AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &_chordSound);
        }
    }
}

@end
