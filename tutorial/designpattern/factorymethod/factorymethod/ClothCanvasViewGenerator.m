//
//  ClothCanvasViewGenerator.m
//  factorymethod
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ClothCanvasViewGenerator.h"

@implementation ClothCanvasViewGenerator

- (CanvasView *) (id)canvasViewWithFrame:(CGRect)aFrame {
    return [[[ClothCanvasView alloc] initWithFrame:aFrame] autorelease];
}

@end
