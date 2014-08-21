//
//  ViewController.m
//  Day 13 Web
//
//  Created by Grant Timmerman on 8/23/14.
//  Copyright (c) 2014 Grant Timmerman. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

UIWebView *webView;

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setup web view
    webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    [self.view addSubview:webView];
    
    // Go to page
    NSString *urlString = @"http://www.grant.cm/";
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
