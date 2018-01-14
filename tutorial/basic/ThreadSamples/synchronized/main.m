
/*
 * Sample code
 * 1. synchronized
 *
 */

- (void)addItem:(id)object {
    @synchronized (self) {
        [_mutableItems addObject:object];
    }
}

- (void)removeItem:(id)object {
    @synchronized (self) {
        [_mutableItems removeObject:object];
    }
}

@implementation Synchronized
{
    NSObject _objectForLock;
}

- (id)init
{
    self = [super init];
    if (self) {
        _objectForLock = [[NSObject alloc] init];
    }
    return self;
}

- (void)addItems:(id)object {
    @synchronized (_objectForLock) {
        // TODO
    }
}

/*
 * Sample code
 * 2. Lock
 *
 */

@interface Toliet() {
    NSLock *_lock;
}
@end

@implementation LockTest
@syncthesize item = _item;
