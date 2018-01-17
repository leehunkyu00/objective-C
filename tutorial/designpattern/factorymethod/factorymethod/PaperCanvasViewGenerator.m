//
//  PaperCanvasViewGenerator.m
//  factorymethod
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "PaperCanvasViewGenerator.h"

@implementation PaperCanvasViewGenerator

- (CanvasView *) (id)canvasViewWithFrame:(CGRect)aFrame {
    return [[[PaperCanvasView alloc] initWithFrame:aFrame] autorelease];
}
@end
