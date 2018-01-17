/*
 * NOTICE : this sample isn't work.
 *
 * message forwarding sample code
 *
 * 1. resolveInstanceMethod
 * 2. forwardingTargetForSelector
 * 3. methodSignatureForSelect
 * 4. forwardInvocation
 * 5. doseNotRecognizeSelector
 *
 * ref : http://hmhv.tistory.com/39
*/

#import <Foundation/Foundation.h>
#import <stdio.h>

@class UIApplication;

@interface TextObject : NSObject
    /* nothing*/
@end

@implementation TextObject

+(BOOL) resolveInstanceMethod: (SEL)sel
{
    NSLog(@"resolveInstanceMethod - %@", NSStringFromSelector(sel));
    return [super resolveInstanceMethod:sel];
}

+(BOOL) resolveClassMethod:(SEL)sel
{
    NSLog(@"resolveClassMethod - %@", NSStringFromSelector(sel));
    return [super resolveClassMethod:sel];
}

-(id) forwardingTargetForSelector:(SEL)sel
{
    NSLog(@"forwardingTargetForSelector - %@", NSStringFromSelector(sel));
    return [super forwardingTargetForSelector:sel];
}

-(NSMethodSignature *)methodSignatureForSelector:(SEL)sel
{
    NSLog(@"methodSignatureForSelect - %@", NSStringFromSelector(sel));

    NSString *types = @"@@:";
    return [NSMethodSignature signatureWithObjCTypes:[types UTF8String]];
}

-(void)forwardInvocation:(NSInvocation *)invocation
{
    SEL sel = [invocation selector];
    NSLog(@"forwardInvocation - %@", NSStringFromSelector(sel));

    return [super forwardInvocation:invocation];
}

-(void)doesNotRecognizeSelector:(SEL)sel
{
    NSLog(@"doseNotRecognizeSelector - %@", NSStringFromSelector(sel));
    [super doseNotRecognizeSelector:sel];
}
@end

@implementation AppDelegate : NSObject
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOption:(NSDictionary *)launchOptions
{
    TextObject *to = [TextObject new];
    [to performSelector:NSSelectorFromString(@"nono")];

    return YES;
}
@end

int main(void)
{
    AppDelegate *appDelegate = [[AppDelegate alloc] init];
    [appDelegate application];

    return 0;
}
