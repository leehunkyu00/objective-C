//
//  main.m
//  NSStringTest
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSString *str = [[NSString alloc] initWithString:@"This is NSString"];
        NSString *str = [[NSString alloc] init];
        str = @"This is NSString";
        NSLog(@"str : %@\n", str);
        
        // immutable class
        NSString *result;
        result = [str substringFromIndex:6];
        result = [str substringToIndex:3];
        
        result = [[str substringToIndex:11] substringFromIndex:8];
        result = [[str substringFromIndex:8]substringToIndex:3];
        result = [[str substringWithRange:NSMakeRange(8, 3)]lowercaseString];
        result = [[str substringWithRange:NSMakeRange(8, 3)]uppercaseString];
        NSLog(@"str : %@\n", result);

        // NSMutableString
        NSMutableString *mstr = [NSMutableString stringWithString:str];
        [mstr appendString:@" and NSMutableString"];
        [mstr insertString:@"Mutable " atIndex:8];
        
        NSLog(@"mstr : %@\n", mstr);
    }
    return 0;
}
