//
//  SierraBrandingFactory.m
//  abstractfactory
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "SierraBrandingFactory.h"

@implementation SierraBrandingFactory

- (UIView *) brandedView {
    return [[[SierraView alloc] init] autorelease];
}

- (UIButton *)brandedMainButton {
    return [[[SierraMainButton alloc] init] autorelease];
}

- (UIToolbar *) brandedToolbar {
    return [[[SierraToolbar alloc] init] autorelease];
}

@end
