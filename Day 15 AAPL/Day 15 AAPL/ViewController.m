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
    _symbolLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/2)];
    _stockPriceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    _changeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2)];
    _timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)];
    _symbolLabel.textColor = [UIColor whiteColor];
    _stockPriceLabel.textColor = [UIColor whiteColor];
    _changeLabel.textColor = [UIColor whiteColor];
    _timeLabel.textColor = [UIColor whiteColor];
    _symbolLabel.textAlignment = NSTextAlignmentCenter;
    _stockPriceLabel.textAlignment = NSTextAlignmentCenter;
    _changeLabel.textAlignment = NSTextAlignmentCenter;
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    _symbolLabel.font = [UIFont systemFontOfSize:30];
    _stockPriceLabel.font = [UIFont systemFontOfSize:50];
    _changeLabel.font = [UIFont systemFontOfSize:30];
    [self.view addSubview:_symbolLabel];
    [self.view addSubview:_stockPriceLabel];
    [self.view addSubview:_changeLabel];
    [self.view addSubview:_timeLabel];
    
    // Update the stocks
    [self updateStocks];
    
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
    data = [data stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    
    // If we got the data, update the view
    if (data != nil) {
        NSArray *dataItems = [data componentsSeparatedByString:@","];
        
        // Parse the data
        NSString *symbol = dataItems[0];
        NSString *price = dataItems[1];
        NSString *date = dataItems[2];
        NSString *time = dataItems[3];
        NSString *change = dataItems[4];
        
        // Update the UI
        _symbolLabel.text = symbol;
        _stockPriceLabel.text = price;
        _changeLabel.text = change;
        _timeLabel.text = [NSString stringWithFormat:@"%@ %@", date, time];
        
        // Change the color if the change is positive
        if ([change characterAtIndex:0] == '-') {
            _changeLabel.textColor = [UIColor redColor];
        } else {
            _changeLabel.textColor = [UIColor greenColor];
        }
    }
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
