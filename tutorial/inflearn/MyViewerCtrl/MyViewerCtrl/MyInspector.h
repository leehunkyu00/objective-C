//
//  MyInspector.h
//  MyViewerCtrl
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#ifndef MyInspector_h
#define MyInspector_h

#import <Foundation/NSObject.h>

@class NSPanel, NSNotification;

@interface MyInspector: NSObject
{
    NSPanel *panel;
    id text;
    BOOL isClosed;
}

+ (id)sharedInstance;
- (id)init;
- (void)activate;
- (void)showMain:(NSNotification *)aNotification;
- (void)windowClosed:(NSNotification *)aNotification;
- (void)shrinkAll:(id)sender;

/* delegate message */
- (void)windowDidBecomeKey:(NSNotification *)aNotification;
- (BOOL)windowShouldClose:(id)sender;
@end

#endif /* MyInspector_h */
