//
//  ViewController.h
//  FlightBooking
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    NSInteger buttonTag;
}

@property (strong, nonatomic) IBOutlet UILabel *returnDateLabel;
@property (strong, nonatomic) IBOutlet UIButton *returnDateButton;
@property (strong, nonatomic) IBOutlet UIDatePicker *selectDatePicker;
- (IBAction)showReturnDateAction:(id)sender;
- (IBAction)showDatePickerAction:(id)sender;
- (IBAction)selectDateAction:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *departureDateButton;

@end

