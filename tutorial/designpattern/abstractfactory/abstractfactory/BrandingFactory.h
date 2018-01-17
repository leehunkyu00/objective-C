//
//  BrandingFactory.h
//  abstractfactory
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrandingFactory : NSObject

+ (BrandingFactory *) factory;
- (UIView *) brandedView;
- (UIButton *)brandedMainButton;
- (UIToolbar *) brandedToolbar;

@end
