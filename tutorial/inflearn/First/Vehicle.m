//
//  Vehicle.m
//  First
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "Vehicle.h"


@implementation Vehicle
@synthesize wheels;
@synthesize seats;
//- (void)setWheels:(int)w {
//    wheels = w;
//}
//
//- (void)setSeats:(int)s {
//    seats = s;
//}

- (void)print
{
    NSLog(@"wheels : %i, seats : %i\n", wheels, seats);
}

// (void)drawCircle(int x, int y, int r);
// - (void)drawCircleX:(int)x Y:(int)y R:(int)r;
//-(void)drawCircleXYR:(int)x :(int)y: (int)z;
//[hello drawCircleXYR:1 :3 :2]
- (void)setWheels:(int)w seats:(int)s {
    wheels = w;
    seats = s;
}
//- (int)wheels
//{
//    return wheels;
//}
//- (int)seats
//{
//    return seats;
//}
@end
