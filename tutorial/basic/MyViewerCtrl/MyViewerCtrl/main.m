//
//  main.m
//  MyViewerCtrl
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MyViewerCtrl.h"

int main(int argc, const char * argv[]) {
    
    id controller = [[MyViewerCtrl alloc] init];
    id app = [NSApplication sharedApplication];
    [app setDelegate:controller];
    [controller setupMainMenu];
    [app run];
    return 0;
}
