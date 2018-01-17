//
//  PaperCanvasView.m
//  factorymethod
//
//  Created by hklee on 2018. 1. 17..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "PaperCanvasView.h"

@implementation PaperCanvasView

- (id)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame])) {
        //캔버스 배경으로 용지 형태의 택스처 이미지 뷰를 추가한다.
        UIImage *backgroundImage = [UIImage imageNamed:@"paper"];
        UIImageView *backgroundView = [[[UIImageView alloc] initWithImage:backgroundImage] autorelease];
        [self addSubview:backgroundView];
    }
    
    return self;
}

// specify method

@end
