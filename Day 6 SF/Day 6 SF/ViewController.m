//
//  ViewController.m
//  Day 6 SF
//
//  Created by Grant Timmerman on 8/14/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>

@interface ViewController ()
            

@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup background
    float r = 252;
    float g = 66;
    float b = 29;
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
    
    // Title label
    CGRect titleFrame = CGRectMake(0, 85, self.view.frame.size.width, 100);
    _titleLabel = [[UILabel alloc] initWithFrame:titleFrame];
    [_titleLabel setText:@"You are"];
    [_titleLabel setTextAlignment:NSTextAlignmentCenter];
    [_titleLabel setTextColor:[UIColor whiteColor]];
    [_titleLabel setFont:[UIFont systemFontOfSize:40]];
    [self.view addSubview:_titleLabel];
    
    // Distance label
    CGRect distanceFrame = CGRectMake(0, 180, self.view.frame.size.width, 100);
    _distanceLabel = [[UILabel alloc] initWithFrame:distanceFrame];
    [_distanceLabel setTextColor:[UIColor whiteColor]];
    [_distanceLabel setTextAlignment:NSTextAlignmentCenter];
    [_distanceLabel setFont:[UIFont systemFontOfSize:70]];
    [self.view addSubview:_distanceLabel];
    
    // Direction label
    CGRect directionFrame = CGRectMake(0, 300, self.view.frame.size.width, 100);
    _directionLabel = [[UILabel alloc] initWithFrame:directionFrame];
    [_directionLabel setTextColor:[UIColor whiteColor]];
    [_directionLabel setTextAlignment:NSTextAlignmentCenter];
    [_directionLabel setFont:[UIFont systemFontOfSize:10]];
    [self.view addSubview:_directionLabel];
    
    // Update distance
    [self updateText];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Updates the text with the latest distance data
- (void)updateText {
    float distanceFromSF = [self getDistanceFromSF];
    NSString *distanceText = [NSString stringWithFormat:@"%.2f", distanceFromSF];
    [_distanceLabel setText:distanceText];
}

// Gets the distance from the user's location and SF
- (CLLocationDistance)getDistanceFromSF {
    float sfLat = 1;
    float sfLong = 1;
    CLLocationCoordinate2D yourCoordinate = CLLocationCoordinate2DMake(sfLat, sfLong);
    CLLocationCoordinate2D sfCoordinate = CLLocationCoordinate2DMake(sfLat, sfLong);
    return [self distanceBetweenCoordinates:yourCoordinate otherCoord:sfCoordinate];
}

// Gets the distance between two coordinates in km
- (CLLocationDistance)distanceBetweenCoordinates:(CLLocationCoordinate2D)coord1 otherCoord:(CLLocationCoordinate2D)coord2 {
    CLLocation *location1 = [[CLLocation alloc] initWithLatitude:coord1.latitude longitude:coord1.longitude];
    CLLocation *location2 = [[CLLocation alloc] initWithLatitude:coord2.latitude longitude:coord2.longitude];
    return [location1 distanceFromLocation:location2]/1000;
}

#define degreesToRadians(x) (M_PI * x / 180.0)
#define radiandsToDegrees(x) (x * 180.0 / M_PI)

// Gets the bearing between two points
- (float)getHeadingForDirectionFromCoordinate:(CLLocationCoordinate2D)fromLoc toCoordinate:(CLLocationCoordinate2D)toLoc {
    float fLat = degreesToRadians(fromLoc.latitude);
    float fLng = degreesToRadians(fromLoc.longitude);
    float tLat = degreesToRadians(toLoc.latitude);
    float tLng = degreesToRadians(toLoc.longitude);
    float degree = radiandsToDegrees(atan2(sin(tLng-fLng)*cos(tLat), cos(fLat)*sin(tLat)-sin(fLat)*cos(tLat)*cos(tLng-fLng)));
    return (degree >= 0) ? degree : 360 + degree;
}

@end
