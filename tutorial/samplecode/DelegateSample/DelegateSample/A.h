//
//  A.h
//  DelegateSample
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

// receive class
#import <Foundation/Foundation.h>

@protocol HelloDelegate
- (void)sayHello:(NSString *)msg;
@end

@interface A : NSObject
@property (nonatomic, weak) id<HelloDelegate> delegate;

- (void) triggerHello;
@end
