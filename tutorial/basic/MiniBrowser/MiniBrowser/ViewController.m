//
//  ViewController.m
//  MiniBrowser
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mainWebView, urlTextField, bookmarkSegmentedControl, activityIndicatorView;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *urlString = @"http://facebook.com";
    [mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    urlTextField.text = urlString;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    NSString *urlString = textField.text;
    
    if (![urlString hasPrefix:@"http://"]) {
        urlString = [[NSString alloc] initWithFormat:@"http://%@", urlString];
    }
    [mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    [textField resignFirstResponder];

    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bookmarkAction:(id)sender {
    NSString *bookmarkURL = [bookmarkSegmentedControl titleForSegmentAtIndex:bookmarkSegmentedControl.selectedSegmentIndex];
    
    NSString *urlString = [[NSString alloc] initWithFormat:@"http://www.%@.com", bookmarkURL];
    [mainWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:urlString]]];
    
    urlTextField.text = urlString;
}
-(void)webViewDidStartLoad:(UIWebView *)webView {
    [activityIndicatorView startAnimating];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    [activityIndicatorView stopAnimating];
}
- (IBAction)backAction:(id)sender {
    [mainWebView goBack];
}

- (IBAction)forwardAction:(id)sender {
    [mainWebView goForward];
}

- (IBAction)stopAction:(id)sender {
    [mainWebView stopLoading];
}

- (IBAction)refreshAction:(id)sender {
    [mainWebView reload];
}

@end
