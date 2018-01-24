//
//  ViewController.m
//  SwitchingXIB
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "SubWindowViewController.h"
#import "SubWindow2ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize subWindowView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchView:(id)sender {
    SecondViewController *second = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    second.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:second animated:YES completion:nil];
}

- (IBAction)showView:(id)sender {
    /*
    SubWindowViewController *subWindow = [[SubWindowViewController alloc] initWithNibName:nil bundle:nil];
    
    subWindow.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [subWindow presentViewController:subWindow animated:YES completion:nil];
    
    */
    
    //subWindow = [[[NSBundle mainBundle] loadNibNamed:@"SubWindowViewController" owner:self options:nil] objectAtIndex:0];
    SubWindowViewController *subWindow;
    subWindow = [[SubWindowViewController alloc] initWithNibName:nil bundle:nil];
    
    //subWindowView = subWindow.view;
    [subWindowView addSubview:subWindow.view];

    
}

- (IBAction)showView2:(id)sender {
    SubWindow2ViewController *subWindow;
    subWindow = [[SubWindow2ViewController alloc] initWithNibName:nil bundle:nil];
    
    [subWindowView addSubview:subWindow.view];
}

- (IBAction)showTableView:(id)sender {
}
@end
