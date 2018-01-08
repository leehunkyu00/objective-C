//
//  Figure.m
//  abstractclass
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "Figure.h"
#import <Foundation/NSString.h>
#import <stdio.h>

@implementation Figure

- (void)setLocation:(NSPoint)point {
    location = point;
}

- (void)setSize:(NSSize)newsize { /* virtual */ }
- (float)area { return 0.0; }
- (NSString *)figureName { return nil; }
- (NSString *)stringOfSize { return nil; }

- (NSString *)description {
    return [NSString stringWithFormat:@"%@: location=(%.2f, %.2f), %@, area=%.2f",
            [self figureName], location.x, location.y,
            [self stringOfSize], [self area]];
}
@end
