//
//  ThreadViewController.m
//  ThreadSample
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ThreadViewController.h"

@implementation ThreadViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // create thread
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadTest) object:nil];
    
    // thread start
    [thread start];
    
    //[thread release];
}

- (void)threadTest
{
    while (stop == false) {
        NSLog(@"Infinite thread");
        [NSThread sleepForTimeInterval:0.5f];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    stop = true;
}

@end
