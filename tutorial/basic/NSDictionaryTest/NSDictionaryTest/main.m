//
//  main.m
//  NSDictionaryTest
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dic = [[NSDictionary alloc] initWithObjectsAndKeys:@"test1",@"key1",@"test2", @"key2", nil];
        
//        NSLog(@"key1 : %@", [dic objectForKey:@"key1"]);
//        NSLog(@"key2 : %@", [dic objectForKey:@"key2"]);
        
        NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithDictionary:dic];
        [mdic setObject:@"korea" forKey:@"key3"];
        [mdic setObject:@"japan" forKey:@"key4"];
        NSLog(@"key1 : %@", [mdic objectForKey:@"key1"]);
        NSLog(@"key2 : %@", [mdic objectForKey:@"key2"]);
        NSLog(@"key3 : %@", [mdic objectForKey:@"key3"]);
        NSLog(@"key4 : %@", [mdic objectForKey:@"key4"]);
    }
    return 0;
}
