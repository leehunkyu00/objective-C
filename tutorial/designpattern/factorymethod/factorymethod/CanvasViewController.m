//
//  CanvasViewController.m
//  factorymethod
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "CanvasViewController.h"

@implementation CanvasViewController

@synthesize canvaseView = canvaseView_;

- (void)viewDidLoad {
    [super viewDidLoad];
    CanvasViewGenerator *defaultGenerator = [[[CanvasViewGenerator alloc] init] autorelease];
    [self loadCanvasViewWithGenerator:defaultGenerator];
}

- (void) loadCanvasViewWithGenerator:(CanvasViewGenerator *)generator {
    [canvasView_ removeFromSuperview];
    CGRect aFrame = CGRectMake(0, 0, 320, 436);
    CanvasView *aCanvasView = [generator canvasViewWithFrame:aFrame];
    [self setCanvasView:aCanvasView];
    [[self view] addSubview:canvasView_];
}

@end
