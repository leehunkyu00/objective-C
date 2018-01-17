//
//  PaperCanvasViewGenerator.h
//  factorymethod
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "CanvasViewGenerator.h"
#import "PaperCanvasView.h"

@interface PaperCanvasViewGenerator : CanvasViewGenerator
{
    
}

- (CanvasView *) (id)canvasViewWithFrame:(CGRect)aFrame;

@end
