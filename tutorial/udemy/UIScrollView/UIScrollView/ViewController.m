//
//  ViewController.m
//  UIScrollView
//
//  Created by hklee on 2018. 1. 29..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    //
    [self.scrollView setContentSize:CGSizeMake(0, 1500)];
}


@end
