//
//  Vehicle.h
//  First
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Vehicle : NSObject
{
    // member variable
    //    int wheels;     // int float double long - primitive type
    //    int seats;  // auto intialize
}
// member method
//@property (getter=getWheels, setter=setWheels:) int wheels;
@property int wheels;
@property int seats;
//- (void)setWheels:(int)w;
//- (void)setSeats:(int)s;
//- (int)wheels;
//- (int)seats;
- (void)print;
- (void)setWheels:(int)w seats:(int)s;

@end
