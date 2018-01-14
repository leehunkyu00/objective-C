//
//  ThreadViewController.h
//  ThreadSample
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#ifndef ThreadViewController_h
#define ThreadViewController_h

#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>
#import <Cocoa/Cocoa.h>

@interface ThreadViewController : NSViewController {
    bool stop;
}
@property (nonatomic, assign) bool stop;

- (void)viewDidLoad;
- (void)threadTest;
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;

@end


#endif /* ThreadViewController_h */
