//
//  ViewController.h
//  MiniBrowser
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate, UIWebViewDelegate>

@property (strong, nonatomic) IBOutlet UISegmentedControl *bookmarkSegmentedControl;
@property (strong, nonatomic) IBOutlet UIWebView *mainWebView;
@property (strong, nonatomic) IBOutlet UITextField *urlTextField;
- (IBAction)bookmarkAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
- (IBAction)backAction:(id)sender;
- (IBAction)forwardAction:(id)sender;
- (IBAction)stopAction:(id)sender;
- (IBAction)refreshAction:(id)sender;

@end

