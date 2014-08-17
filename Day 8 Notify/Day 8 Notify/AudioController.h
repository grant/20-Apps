//
//  AudioController.h
//  Day 8 Notify
//
//  Created by Grant Timmerman on 8/17/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AudioController : NSObject

- (instancetype)init;
- (void)playSystemSound:(NSString*)sound;

@end
