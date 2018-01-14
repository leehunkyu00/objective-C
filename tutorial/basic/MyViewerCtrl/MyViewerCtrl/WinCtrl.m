//
//  WinCtrl.m
//  MyViewerCtrl
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//


#import "WinCtrl.h"
#import <Cocoa/Cocoa.h>

#define ImageSizeMIN 32
#define TitleBarHeight 22

/* extern */ NSString *ShrinkAllNotification = @"ShrinkAllNotification";
/* extern */ NSString *SizeDidChangeNotification = @"SizeDidChangeNotification";

static BOOL autoResize = NO;
static NSSize screenSize = { 1028.0, 768.0 };

@implementation WinCtrl

+ (void)initialize
{
    static BOOL nomore = NO;
    if (nomore == NO) {
        NSScreen *screen = [[NSScreen screens] objectAtIndex:0];
        screenSize = [screen visibleFrame].size;
        nomore = YES;
    }
}

+ (BOOL)autoResize { return autoResize; }
+ (void)setAutoResize:(BOOL)flag {
    autoResize = flag;
}

/* local method */
- (void)windowSetup
{
    static int wincount = 0;
    float sft = (wincount++ & 07) * 20.0;
    id imageview;
    NSRect winrect, imgrect, contrect;
    float x, y;
    NSUInteger wstyle = (NSTitledWindowMask | NSClosableWindowMask |
                         NSMiniaturizableWindowMask);
    contrect.size.width = (int)(originalSize.width * mag);
    contrect.size.height = (int)(originalSize.height * mag);
    contrect.origin = NSZeroPoint;
    winrect = [NSWindow frameRectForContentRect:contrect styleMask:wstyle];
    x = 100.0 + sft;
    y = 150.0 + sft;
    if (x + winrect.size.width > screenSize.width)
        x = screenSize.width - winrect.size.width;
    if (y + winrect.size.height > screenSize.height)
        y = screenSize.height - winrect.size.height;
    contrect.origin = NSMakePoint(x, y);
    window = [[NSWindow alloc] initWithContentRect:contrect
                                styleMask:wstyle
                                backing:NSBackingStoreBuffered
                                defer:YES];
    [window setReleasedWhenClosed:YES];
    imgrect.size = originalSize;
    imgrect.origin = NSZeroPoint;
    imageview = [[NSImageView alloc] initWithFrame:imgrect];
    [imageview setImage:docImage];
    [imageview setEditable:NO];
    [imageview setImageScaling:YES];
    [imageview setFrameSize: contrect.size];
    
    [window setContentView:imageview];
    [window makeFirstResponder:imageview];
}

/* local method*/
- (void)shrinkAll:(NSNotification *)notification
{
    [self shrink:[notification object]];
}

- (id)initWithFile:(NSString *)path
{
    NSImageRep *rep;
    int x;
    
    if ((self = [super init]) == nil) {
        return nil;
    }
    if ((docImage = [[NSImage alloc] initWithContentsOfFile:path]) == nil) {
        return nil;
    }
    undoManager = [[NSUndoManager alloc] init];
    filename = path;
    originalSize = [docImage size];
    rep = [docImage bestRepresentationForDevice:nil];
    x = [rep pixelsWide];
    if (x != NSImageRepMatchesDevice && x != originalSize.width) {
        originalSize = NSMakeSize(x, [rep pixelsHigh]);
        [docImage setSize:originalSize];
    }
    mag = 1.0;
    if (autoResize) {
        double wr = screenSize.width / originalSize.width;
        double hr = (screenSize.height - TitleBarHeight) / originalSize.height;
        double ratio = (wr < hr) ? wr : hr;
        if (ratio < 1.0)
            mag = ratio;
    }
    [self windowSetup];
    [[NSNotificationCenter defaultCenter] addObserver:self
                        selector:@selector(shrinkAll:)
                        name:ShrinkAllNotification
                        object:nil
     ];
    [window setDelegate:self];
    [window setTitleWithRepresentedFilename:filename];
    [window makeKeyAndOrderFront:self];
    [window setDocumentEdited:(mag < 1.0)];
    
    return self;
}

- (NSString *)attributesOfImage
{
    static NSString *fnamestr, *sizestr, *magstr;
    NSSize sz;
    
    if (fnamestr == nil) {
        fnamestr = NSLocalizedString(@"Filename", "filename");
        sizestr = NSLocalizedString(@"Size", "Size");
        magstr = NSLocalizedString(@"Magnification", "Magnification");
    }
    sz = [docImage size];
    return [NSString stringWithFormat:@"%@ : %@\n%@: %d x %d\n%@: %.1lf%%",
            fnamestr, [filename lastPathComponent],
            sizestr, (int)sz.width, (int)sz.height, magstr,
            mag*100.0];
}

/* local method */
- (void)setScaleFactor:(double)factor
{
    id view = [window contentView];
    NSRect rect = [window frame];
    NSSize prev = rect.size;
    NSSize sz = [view frame].size;
    int wdif = prev.width - sz.width;
    int hdif = prev.height - sz.height;
    static NSString *shrinkName = nil;
    
    if (shrinkName == nil)
        shrinkName = NSLocalizedString(@"Shrink", "");
    [[undoManager prepareWithInvocationTarget:self]
     setScaleFactor:mag];
    [undoManager setActionName:shrinkName];
    
    mag = factor;
    sz.width = (int)(originalSize.width * mag);
    sz.height = (int)(originalSize.height * mag);
    
    [view setFrameSize:sz];
    rect.size.width = sz.width + wdif;
    rect.size.height = sz.height + hdif;
    rect.origin.x += (int)(prev.width - rect.size.width) / 2;
    rect.origin.y += (int)(prev.height - rect.size.height) / 2;
    [window setFrame:rect display:YES];
    [window setDocumentEdited:(mag < 1.0)];
    [[NSNotificationCenter defaultCenter]
         postNotificationName:SizeDidChangeNotification
         object:window];
}

- (void)shrink:(id)sender
{
    NSSize sz = [[window contentView] frame].size;
    if (sz.width < ImageSizeMIN || sz.height < ImageSizeMIN)
        return ;
    [self setScaleFactor:(mag * 0.5)];
}

/* delegate message */
- (BOOL)windowShouldClose:(id)sender
{
    static NSString *warnstr, *closestr, *okstr, *cancelstr;
    if (warnstr == nil) {
        warnstr = NSLocalizedString(@"File %@ is edited.", "Edited");
        closestr = NSLocalizedString(@"Close the window?", "Close?");
        okstr = NSLocalizedString(@"OK", "OK");
        cancelstr = NSLocalizedString(@"Cancel", "Cancel");
    }
    if ([window isDocumentEdited])
        return NSRunAlertPanel(closestr, warnstr, okstr, cancelstr, nil,
                               [filename lastPathComponent]) ==
        NSAlertDefaultReturn;
    
    return YES;
        
}
@end
