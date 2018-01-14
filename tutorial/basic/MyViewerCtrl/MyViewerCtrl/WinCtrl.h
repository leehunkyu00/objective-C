//
//  WinCtrl.h
//  MyViewerCtrl
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#ifndef WinCtrl_h
#define WinCtrl_h

#import <Foundation/NSObject.h>
#import <Foundation/NSString.h>
#import <Foundation/NSGeometry.h>

@class NSWindow, NSNotification, NSUndoManager;

extern NSString *ShrinkAllNotification;
extern NSString *SizeDidChangeNotification;

@interface WinCtrl : NSObject
{
    NSString *filename;
    id docImage;
    NSSize originalSize;
    NSWindow *window;
    NSUndoManager *undoManager;
    double mag;
}

+ (void)initialize;
+ (BOOL)autoResize;
+ (void)setAutoResize:(BOOL)flag;
- (id)initWithFile:(NSString *)path;
- (NSString *)attributesOfImage;
- (void)shrink:(id)sender;

/* delegate message */
- (BOOL)windowShouldClose:(id)sender;
- (NSUndoManager *)windowWillReturnUndoManager:(NSWindow *)win;

@end
#endif /* WinCtrl_h */
