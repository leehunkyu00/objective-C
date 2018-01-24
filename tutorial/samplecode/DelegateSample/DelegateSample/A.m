//
//  A.m
//  DelegateSample
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "A.h"

@implementation A
@synthesize delegate;


- (void) triggerHello {
    NSLog(@"[A] (void) triggerHello");
    [delegate sayHello:@"HI IM KYU"];
}
@end
