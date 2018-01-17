//
//  CanvasViewGenerator.m
//  factorymethod
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "CanvasViewGenerator.h"

@implementation CanvasViewGenerator

- (CanvasView *) canvasViewWithFrame:(CGRect) aFrame {
    return [[[CanvasView alloc] initWithFrame:aFrame] autorelease];
}

@end
