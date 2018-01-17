//
//  AcmeBrandingFactory.h
//  abstractfactory
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "BrandingFactory.h"

@interface AcmeBrandingFactory : BrandingFactory
{
    
}

- (UIView *) brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *) brandedToolbar;

@end
