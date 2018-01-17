//
//  MyViewerCtrl.h
//  MyViewerCtrl
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//

#ifndef MyViewerCtrl_h
#define MyViewerCtrl_h

#import <Foundation/NSObject.h>

@class NSNotification;

@interface MyViewerCtrl : NSObject
{
    id autoResizeItem;
}

- (void)setupMainMenu;
- (void)openFile:(id)sender;
- (void)activateInspector:(id)sender;
- (void)toogleAutoResize:(id)sender;

/* delegate message */
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification;
- (void)applicationWillTerminate:(NSNotification *)aNotification;
@end

#endif /* MyViewerCtrl_h */
