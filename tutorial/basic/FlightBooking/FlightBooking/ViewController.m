//
//  ViewController.m
//  FlightBooking
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize returnDateLabel, returnDateButton, selectDatePicker, departureDateButton;

- (void)viewDidLoad {
    [super viewDidLoad];
    returnDateLabel.hidden = YES;
    returnDateButton.hidden = YES;
    selectDatePicker.hidden = YES;
    
    buttonTag = 0;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
    selectDatePicker.hidden = YES;
}


- (IBAction)showReturnDateAction:(id)sender {
    
    //NSLog(@"description(1) : %@", [sender description]);
    /*
    if (returnDateButton.hidden == YES) {
        returnDateLabel.hidden = NO;
        returnDateButton.hidden = NO;
        selectDatePicker.hidden = NO;
    } else {
        returnDateLabel.hidden = YES;
        returnDateButton.hidden = YES;
        selectDatePicker.hidden = YES;
    }
    */
    
    /*
    if ([sender isOn]) {
        returnDateLabel.hidden = NO;
        returnDateButton.hidden = NO;
        selectDatePicker.hidden = NO;
    } else {
        returnDateLabel.hidden = YES;
        returnDateButton.hidden = YES;
        selectDatePicker.hidden = YES;
    }
     */
    
    returnDateLabel.hidden = ![sender isOn];
    returnDateButton.hidden = ![sender isOn];
}

- (IBAction)showDatePickerAction:(id)sender {
    //NSLog(@"description(2) : %@", [sender description]);
    selectDatePicker.hidden = NO;
    buttonTag = [sender tag];
}

- (IBAction)selectDateAction:(id)sender {
    //NSLog(@"description(3) : %@", [sender description]);
    NSDate *today = [[NSDate alloc] init];
    NSLog(@"today : %@", today);
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"YY-MM-d hh:mma";
    
    //NSString *dateString = [formatter stringFromDate:[selectDatePicker date]];
    NSString *dateString = [formatter stringFromDate:[sender date]];
    NSLog(@"%@", dateString);
    
    if (buttonTag == 1) {
        [departureDateButton setTitle:dateString forState:UIControlStateNormal];
    } else if (buttonTag == 2) {
        [returnDateButton setTitle:dateString forState:UIControlStateNormal];
    }
}

@end
