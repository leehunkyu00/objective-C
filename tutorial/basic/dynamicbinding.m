/*
 * for resolceInstanceMethod
 */
#import <Foundation/Foundation.h>
#import <objc/runtime.h>
#import <stdio.h>

@interface Mystery : NSObject {
    id evidence;
}

@property id evidence;
@end

@implementation Mystery
@dynamic evidence;

static id getter(Mystery *obj, SEL _) {
    return obj->evidence;
}

static void setter(Mystery *obj, SEL _, id arg) {
    if ([arg isKindOfClass:[NSString class]])
        arg = [@"No " stringByAppendingString: arg];
    obj->evidence = arg;
}

+ (BOOL)resolveInstanceMethod:(SEL)aSEL
{
    if (aSEL == @selector(evidence))
        class_addMethod(self, aSEL, (IMP)getter, "@@:");
    else if (aSEL == @selector(setEvidence:))
        class_addMethod(self, aSEL, (IMP)setter, "v@:@");
    return YES;
}
@end

int main(void)
{
    Mystery *m = [[Mystery alloc] init];
    m.evidence = @"Witness";
    printf("%s\n", [m.evidence UTF8String]);

    return 0;
}


