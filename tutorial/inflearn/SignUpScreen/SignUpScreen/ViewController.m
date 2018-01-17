//
//  ViewController.m
//  SignUpScreen
//
//  Created by 이훈규 on 2018. 1. 14..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nameTextField, idTextField, passwordTextField, telTextField, blogTextField, resultTextView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //nameTextField.delegate = self;
    //idTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

// input parameter
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    //[nameTextField resignFirstResponder];
    //[idTextField resignFirstResponder];
    [textField resignFirstResponder];
    /* degugging */
    return YES;
}


- (IBAction)signUpAction:(id)sender {

    resultTextView.text = [NSString stringWithFormat:@"%@ 님 가입을 축하드립니다.",
                           nameTextField.text];
}
@end
