//
//  B.m
//  DelegateSample
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "B.h"

@implementation B
@synthesize aClass;

- (void)runB {
    NSLog(@"[B] runB");
    aClass = [[A alloc] init];

    aClass.delegate = self; // if not assign HelloDelegate protocol, this sentense is ridiculous
    // But, If not assign HelloDelegate protocol, this function is working.
    [aClass triggerHello];
}

- (void)sayHello:(NSString *)msg {
    NSLog(@"[B] sayHello : %@", msg);
}
@end
