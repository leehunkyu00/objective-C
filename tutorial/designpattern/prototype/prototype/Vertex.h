//
//  Vertex.h
//  prototype
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "Mark.h"

@interface Vertex : NSObject <Mark, NSCopying>
{
    @protected CGPoint location_;
}

...

- (id) copyWithZone:(NSZone *)zone;


@end
