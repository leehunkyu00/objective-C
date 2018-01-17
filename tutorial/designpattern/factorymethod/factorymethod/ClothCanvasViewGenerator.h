//
//  ClothCanvasViewGenerator.h
//  factorymethod
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ClothCanvasView.h"
#import "CanvasViewGenerator.h"

@interface ClothCanvasViewGenerator : CanvasViewGenerator
{
    
}

- (CanvasView *) (id)canvasViewWithFrame:(CGRect)aFrame;

@end
