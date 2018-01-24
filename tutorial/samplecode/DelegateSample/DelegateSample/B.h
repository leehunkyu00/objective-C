//
//  B.h
//  DelegateSample
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "A.h"

@interface B : NSObject <HelloDelegate>
@property (nonatomic, strong) A* aClass;

- (void)runB;

@end
