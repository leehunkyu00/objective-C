//
//  main.m
//  First
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

// '<' """ difference search location

#import <Foundation/Foundation.h>
#import "Vehicle.h"
// (class object, instance object) == object

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Vehicle *hello = [[Vehicle alloc] init]; // create instance object //alloc ??
        // new = alloc + init -> [Vehicle new]
        // method chain -> [[Vehicle alloc] init]
        
        // [Receiver Message] send
        [hello setWheels:4];
        [hello setSeats:2];
        
        hello.wheels = 4;
        hello.seats = 2;
        
        
        [hello print];

        NSLog(@"wheels : %i, sheat : %i\n", [hello wheels], [hello seats]);
        NSLog(@"wheels : %i, sheat : %i\n", hello.wheels, hello.seats);
        //NSLog(@"wheels : %i, sheat : %i\n", wheels, seats);
    }
    return 0;
}
