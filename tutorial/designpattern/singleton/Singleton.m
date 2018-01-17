//
//  Singleton.m
//  singleton
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "Singleton.h"

@implementation Singleton

static Singleton *sharedSingleton = nil;

+ (Singleton *)sharedInstance {
    if (sharedSingleton == nil) {
        sharedSingleton = [[super allocWithZone:NULL] init];
    }
    
    return sharedSingleton;
}

+ (id) allocWithZone:(struct _NSZone *)zone {
    return [[self sharedInstance] retain];
}

- (id) copyWithZone:(NSZone *)zone {
    return self;
}

- (id) retain {
    return self;
}

- (NSUInteger) retainCount {
    return NSUIntegerMax;
}

- (void) release {
    // no implements
}

- (id)autorelease {
    return self;
}
@end
