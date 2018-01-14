//
//  main.m
//  NSArrayTest
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *month = [[NSArray alloc] initWithObjects:@"January", @"asdf", @"asdf", @"asdf", @"asdf", @"asdf", @"asdf", @"asdf", @"asdf", nil];
        
//        for (int i=0; i < [month count]; i++) {
//            //NSLog(@"str : %@", month[i] );  // C style
//            NSLog(@"str : %@", [month objectAtIndex:i] );
//        }
        for (NSString *strTemp in month) {
            NSLog(@"str : %@", strTemp);
        }
        
        NSMutableArray *mmonth = [NSMutableArray arrayWithArray:month];
        [mmonth addObject:@"test1"];
        [mmonth addObject:@"test2"];
        [mmonth addObject:@"test3"];
        
        for (NSString *strTemp in mmonth) {
            NSLog(@"mstr : %@", strTemp);
        }
    }
    return 0;
}
