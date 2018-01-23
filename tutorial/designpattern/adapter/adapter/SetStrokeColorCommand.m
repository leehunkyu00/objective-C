//
//  SetStrokeColorCommand.m
//  adapter
//
//  Created by hklee on 2018. 1. 18..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "SetStrokeColorCommand.h"

@implementation SetStrokeColorCommand

@synthesize delegate = delegate_;

-(void) execute {
    CFFloat redValue = 0.0;
    CFFloat blueValue = 0.0;
    CFFloat greenValue = 0.0;
    
    [delegate_ command:self didRequestColorComponenetsForRed:&redValue
                                   green:&greenValue
                                    blue:&blueValue];
    
    UIColor *color = [UIColor colorWithRed:redValue
                                     green:greenValue
                                      blue:blueValue
                                     alpha:1.0];
    
    CoordinatingController *coordinator = [CoordinatingController sharedInstance];
    CanvasViewController *controller = [coordinator canvasViewController];
    [controller SetStrokeColor:color];
    
    [delegate_ command:self didFinishColorUpdateWithColor:color];
}

- (void)dealloc {
    [super dealloc];
}

@end
