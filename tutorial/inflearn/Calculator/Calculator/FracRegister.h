//
//  FracRegister.h
//  Calculator
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//

#ifndef FracRegister_h
#define FracRegister_h

#import <Foundation/NSObject.h>
#import "Fraction.h"

@interface FracRegister : NSObject
{
    Fraction *current;
    Fraction *prev;
}

- (id)init;
- (void)dealloc;
- (Fraction *)currentValue;
- (void)setCurrentValue:(Fraction *)val;
- (BOOL)undoCalc;
- (void)calculate:(char)op with:(Fraction *)arg;

@end
#endif /* FracRegister_h */
