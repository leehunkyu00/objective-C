//
//  main.m
//  DelegateSample
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "B.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //NSLog(@"Hello, World!");
        B *bClass;
        bClass = [[B alloc] init];
        [bClass runB];
    }
    return 0;
}
