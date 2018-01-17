//
//  ViewController.h
//  SignUpScreen
//
//  Created by 이훈규 on 2018. 1. 14..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>

// First step, design
//
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *idTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *telTextField;
@property (strong, nonatomic) IBOutlet UITextField *blogTextField;
- (IBAction)signUpAction:(id)sender;
@property (strong, nonatomic) IBOutlet UITextView *resultTextView;

@end

