/* sample code */

// using performSelector
[self performSelector:@selector(doSomething)
        widthObject:nil
        afterDelay:5.0];

// using dispatch_after
dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW,
                                    (int64_t)(5.0 * NSEC_PER_SEC));
dispatch_after(time, dispatch_get_main_queue(), ^(void) {
        [self doSomething];
});



