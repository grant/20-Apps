//
//  ViewController.m
//  Day 15 AAPL
//
//  Created by Grant Timmerman on 8/24/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup UI
    _stockPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:_stockPriceLabel];
    
    // Setup background
    float r = 255;
    float g = 176;
    float b = 49;
    UIColor *backgroundColor = [UIColor colorWithRed:r/255 green:g/255 blue:b/255 alpha:255];
    [self.view setBackgroundColor:backgroundColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateStocks {
    // Setup request
    NSString *reqString = @"http://download.finance.yahoo.com/d/quotes.csv?s=AAPL&f=sl1d1t1c1ohgv&e=.csv";
    NSURL *reqURL = [NSURL URLWithString:reqString];
    NSString *data = [self getDataFrom:reqURL];
    NSArray *dataItems = [data componentsSeparatedByString:@","];
}

- (NSString *) getDataFrom:(NSURL*)url{
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setHTTPMethod:@"GET"];
    [request setURL:url];
    
    NSError *error = [[NSError alloc] init];
    NSHTTPURLResponse *responseCode = nil;
    
    NSData *oResponseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&responseCode error:&error];
    
    if ([responseCode statusCode] != 200){
        NSLog(@"Error getting %@, HTTP status code %i", url, [responseCode statusCode]);
        return nil;
    }
    
    return [[NSString alloc] initWithData:oResponseData encoding:NSUTF8StringEncoding];
}

@end
