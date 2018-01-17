//
//  MyInspector.m
//  MyViewerCtrl
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "MyInspector.h"
#import <Cocoa/Cocoa.h>
#import "WinCtrl.h"

#define PanelWidthDef   250
#define PanelHeightDef  200
#define BtnWidth        64
#define BtnHeight       32
#define Margin          10

@implementation MyInspector

static id sharedInstance = nil;

+ (id)sharedInstance
{
    if (sharedInstance == nil) {
        sharedInstance = [[self alloc] init];
    }
    [sharedInstance activate];
    return sharedInstance;
}

/* local method */
- (void)panelSetting
{
    id button[2];
    NSBundle *bundle;
    NSString *localstr;
    NSRect rect;
    float wid, hgt;
    int i;
    
    bundle = [NSBundle bundleForClass:[self class]];
    rect = NSMakeRect(300, 300, PanelWidthDef, PanelHeightDef);
    panel = [[NSPanel alloc] initWithContentRect:rect
        styleMask:(NSTitledWindowMask | NSClosableWindowMask | NSResizableWindowMask)
        backing:NSBackingStoreBuffered
        defer:YES];
    [panel setReleasedWhenClosed:NO];
    [panel setMinSize:NSMakeSize(PanelWidthDef, PanelHeightDef)];
    [panel setFrameAutosaveName:@"Inspector Panel"];
    localstr = [bundle localizedStringForKey:@"Inspector"
                                       value:@""
                                       table:nil];
    [panel setTitle: localstr];
    [panel setDelegate: self];
    isClosed = YES;
    
    for (i = 0; i < 2; i++) {
        button[i] = [[NSButton alloc] initWithFrame:
                     NSMakeRect(Margin+(Margin+BtnWidth)*i,
                                Margin,
                                BtnWidth,
                                BtnHeight)];
        [[panel contentView] addSubview:button[i]];
        [button[i] setAutoresizesSubviews:YES];
        [(NSButton *)button[i] setAutoresizingMask:(NSViewMaxXMargin | NSViewMaxYMargin)];
        // [button[i] setAutoresizingMask:(NSViewMaxXMargin | NSViewMaxYMargin)];
    }
    
    localstr = [bundle localizedStringForKey:@"Shrink" value:@"" table:nil];
    [button[0] setTitle: localstr];
    [button[0] setAction:@selector(shrink:)];
    [button[0] setTarget:nil];  // target == first responder
    localstr = [bundle localizedStringForKey:@"All" value:@"" table:nil];
    [button[1] setTitle: localstr];
    [button[1] setAction:@selector(shrinkAll:)];
    [button[1] setTarget:self];
    
    rect = [panel frame];
    wid = rect.size.width - Margin*2;
    hgt = rect.size.height - (Margin + BtnHeight) * 2;
    text = [[NSTextField alloc] initWithFrame:
            NSMakeRect(Margin, BtnHeight*2 - Margin, wid, hgt)];
    [text setSelectable:YES];
    [text setEditable:YES];     // You can make it disable
    [text setBezeled:YES];
    [[panel contentView] addSubview: text];
    [text setAutoresizesSubviews:YES];
    //[text setAutoresizingMask: (NSViewWidthSizable | NSViewHeightSizable)];
    [(NSText *)text setAutoresizingMask: (NSViewWidthSizable | NSViewHeightSizable)];
}

- (id)init
{
    id center;

    if ((self = [super init]) != nil) {
        [self panelSetting];
        center = [NSNotificationCenter defaultCenter];
        [center addObserver:self selector:@selector(showMain:) name:NSWindowDidBecomeMainNotification object:nil];
        [center addObserver:self selector:@selector(showMain:) name:SizeDidChangeNotification object:nil];
        [center addObserver:self selector:@selector(windowClosed:) name:NSWindowWillCloseNotification object:nil];
    }
    return self;
}

- (void)activate
{
    [panel setFloatingPanel:(YES)];
    [panel makeKeyAndOrderFront:self];
}

/* local method */
- (void)showInfo:(id)obj
{
    NSString *log = @"";
    if ([obj isKindOfClass:[NSWindow class]]) {
        id ctrl = [obj delegate];
        if ([ctrl respondsToSelector:@selector(attributesOfImage)])
            log = [ctrl attributesOfImage];
    }
    [text setStringValue: log];
}

- (void)showMain:(NSNotification *)aNotification
{
    id obj;
    if (!isClosed && (obj = [aNotification object]) == [NSApp mainWindow])
        [self showInfo:obj];
}

- (void)windowClosed:(NSNotification *)aNotification
{
    if (!isClosed && [aNotification object] == [NSApp mainWindow])
        [text setStringValue:@""];
}

- (void)shrinkAll:(id)sender
{
    [[NSNotificationCenter defaultCenter]
         postNotificationName:ShrinkAllNotification object:self];
}

/* delegate message */
- (void)windowDidBecomeKey:(NSNotification *)aNotification
{
    isClosed = NO;
    [self showInfo:[NSApp mainWindow]];
}

/* delegate message*/
- (BOOL)windowShouldClose:(id)sender
{
    isClosed = YES;
    return YES;
}

@end
