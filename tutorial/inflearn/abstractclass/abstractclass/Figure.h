//
//  Figure.h
//  abstractclass
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//

#ifndef Figure_h
#define Figure_h

#import <Foundation/NSObject.h>
#import <Foundation/NSGeometry.h>

@class NSString;

@interface Figure : NSObject
{
    NSPoint location;
}
- (void)setLocation:(NSPoint)point;
- (void)setSize:(NSSize)newsize;
- (float)area;
- (NSString *)figureName;
- (NSString *)stringOfSize;
- (NSString *)description;
@end

#endif /* Figure_h */
