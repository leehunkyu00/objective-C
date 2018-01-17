//
//  ViewController.h
//  DigitalFrame
//
//  Created by hklee on 2018. 1. 10..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (nonatomic, strong) IBOutlet UIImageView *imgView;
@property (nonatomic, strong) IBOutlet UIButton *toggleButton;
@property (nonatomic, strong) IBOutlet UISlider *speedSlider;
@property (nonatomic, strong) IBOutlet UILabel *speedLabel;

- (IBAction)toogleAction:(id)sender;
- (IBAction)changeSpeedAction:(id)sender;
@end

