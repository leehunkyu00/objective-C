//
//  ViewController.h
//  SwitchingXIB
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
- (IBAction)switchView:(id)sender;
- (IBAction)showView:(id)sender;
- (IBAction)showView2:(id)sender;
- (IBAction)showTableView:(id)sender;


@property (strong, nonatomic) IBOutlet UIView *subWindowView;


@end

