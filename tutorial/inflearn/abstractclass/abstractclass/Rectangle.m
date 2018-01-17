//
//  Rectangle.m
//  abstractclass
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "Rectangle.h"
#import <Foundation/NSString.h>
#import <stdio.h>
#import <stdlib.h>

@implementation Rectangle

- (void)setSize:(NSSize)newsize {
    size = newsize;
}

- (float)area {
    return size.width * size.height;
}

- (NSString *)figureName {
    return (size.width == size.height) ? @"Square" :
    @"Recntangle";
}

- (NSString *)stringOfSize {
    return [NSString stringWithFormat:@"size=%.2f x %.2f", size.width, size.height];
}
@end



