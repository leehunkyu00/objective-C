//
//  main.m
//  abstractfactory
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrandingFactory.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // using code aboue abstract factory pattern
        BrandingFactory *factory = [BrandingFactory factory];
        // ...
        UIView *view = [factory brandedView];
        // ...
        UIButton *button = [factory brandedMainButton];
        // ...
        UIToolbar *toolbar = [factory brandedToolbar];
        // ...
        
    }
    return 0;
}
