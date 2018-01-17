//
//  ViewController.m
//  DigitalFrame
//
//  Created by hklee on 2018. 1. 10..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imgView;
@synthesize toggleButton;
@synthesize speedSlider;
@synthesize speedLabel;


- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *cuteImages = [[NSArray alloc] initWithObjects:
                            [UIImage imageNamed:@"1.jpg"],
                            [UIImage imageNamed:@"2.jpg"],
                            [UIImage imageNamed:@"3.jpg"],
                            [UIImage imageNamed:@"4.jpg"],
                            [UIImage imageNamed:@"5.jpg"],
                            [UIImage imageNamed:@"6.jpg"],
                            [UIImage imageNamed:@"7.jpg"],
                            [UIImage imageNamed:@"8.jpg"],
                            [UIImage imageNamed:@"9.jpg"],
                            [UIImage imageNamed:@"10.jpg"],
                            [UIImage imageNamed:@"11.jpg"],
                            [UIImage imageNamed:@"12.jpg"],
                            [UIImage imageNamed:@"13.jpg"],
                            [UIImage imageNamed:@"14.jpg"],
                            [UIImage imageNamed:@"15.jpg"],
                           nil
    ];
    imgView.animationImages = cuteImages;
    imgView.animationDuration = 15.0;
}

- (IBAction)toogleAction:(id)sender {
    if ([imgView isAnimating]) {
        [imgView stopAnimating];
        [toggleButton setTitle:@"Start" forState:UIControlStateNormal];
    } else {
        imgView.animationDuration = speedSlider.value;
        [imgView startAnimating];
        [toggleButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
}

- (IBAction)changeSpeedAction:(id)sender {
    imgView.animationDuration = speedSlider.value;
    [imgView startAnimating];
    [toggleButton setTitle:@"Stop" forState:UIControlStateNormal];
    
    speedLabel.text = [NSString stringWithFormat:@"%.2f", speedSlider.value];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
