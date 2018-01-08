//
//  main.m
//  abstractclass
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/NSString.h>
#import <Foundation/NSAutoreleasePool.h>
#import "Figure.h"
#import "Circle.h"
#import "Rectangle.h"
#import <stdio.h>

BOOL testloop(void) {
    Figure *fig = nil;
    NSPoint pnt;
    NSSize sz;
    char buf[64], com;

    do {
        printf("Shape (C=Circle, R=Rectangle, Q=Quit) ? ");
        if (scanf("%s", buf) == 0 || (com = buf[0]) == 'Q' || com == 'q')
            return NO;
        switch (com) {
            case 'C': case 'c': /* Circle */
                fig = [[[Circle alloc] init] autorelease];
                break;
            case 'R': case 'r': /* Rectangle */
                fig = [[[Rectangle alloc] init] autorelease];
                break;
                
            default:
                break;
        }
    } while (fig == nil);
    
    printf("Location? ");
    scanf("%lf %lf", &pnt.x, &pnt.y);

    [fig setLocation: pnt];
    printf("Size ?");
    scanf("%lf %lf", &sz.width, &sz.height);
    [fig setSize: sz];
    printf("%s\n", [[fig description] UTF8String]);
    return YES;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSAutoreleasePool *pool;
        BOOL flag;
        
        do {
            pool = [[NSAutoreleasePool alloc] init];
            flag = testloop();
            [pool release];
        } while (flag);
        
    }
    return 0;
}
