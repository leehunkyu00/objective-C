//
//  Circle.m
//  abstractclass
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "Circle.h"
#import <Foundation/NSString.h>
#import <math.h>
#import <stdio.h>

#define PI 3.14159

@implementation Circle

- (void)setSize:(NSSize)newsize
{
    double x = newsize.width;
    double y = newsize.height;
    radius = sqrt(x * x + y * y);
}

- (float)area {
    return radius * radius * PI;
}

- (NSString *)figureName {
    return @"Circle";
}

- (NSString *)stringOfSize {
    return [NSString stringWithFormat:@"radius=%.2f", radius];
}

@end
