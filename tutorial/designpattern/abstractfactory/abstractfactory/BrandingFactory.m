//
//  BrandingFactory.m
//  abstractfactory
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "BrandingFactory.h"
#import "AcmeBrandingFactory.h"
#import "SierraBrandingFactory.h"

@implementation BrandingFactory

+ (BrandingFactory *) factory {
#if defined (USE_ACME)
    return [[[AcmeBrandingFactory alloc] init] autorelease];
#elif defined (USE_SIERRA)
    return [[[sierraBrandingFactory alloc] init] autorelease];
#else
    return nil;
#endif
}
- (UIView *) brandedView {
    return nil;
}

- (UIButton *)brandedMainButton {
    return nil;
}

- (UIToolbar *) brandedToolbar {
    return nil;
}

@end
