//
//  AcmeBrandingFactory.m
//  abstractfactory
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "AcmeBrandingFactory.h"

@implementation AcmeBrandingFactory

- (UIView *) brandedView {
    return [[[AcmeView alloc] init] autorelease];
}

- (UIButton *)brandedMainButton {
    return [[[AcmeMainButton alloc] init] autorelease];
}

- (UIToolbar *) brandedToolbar {
    return [[[AcmeToolbar alloc] init] autorelease];
}

@end
