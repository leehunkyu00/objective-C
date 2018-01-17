//
//  CanvasViewController.h
//  factorymethod
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "CanvasView.h"
#import "CanvasViewGenerator.h"

@interface CanvasViewController : UIViewController {
    @private
    CanvasView *canvasView;
}

@property (nonatomic, retain) CanvasView *canvasView;
- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator;

@end
