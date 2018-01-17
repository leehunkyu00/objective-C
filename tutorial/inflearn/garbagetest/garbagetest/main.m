//
//  main.m
//  garbagetest
//
//  Created by hklee on 2018. 1. 8..
//  Copyright © 2018년 hklee. All rights reserved.
//
#import <Foundation/NSObject.h>
#import <Foundation/NSGarbageCollector.h>
#import <stdio.h>
#import <stdlib.h>
#import <libc.h>

#define MASS 100000
#define LOOP 4

@interface Chunk : NSObject
{
    int number;
    id target;
    char mass[MASS];
}

- (id)initWithLabel:(const char *)lab;
- (void)setTarget:(id)target;
- (void)finalize;
@end

@implementation Chunk

- (id)initWithLabel:(const char *)lab
{
    static int serial = 0;

    self = [super init];
    number = ++serial;
    target = nil;
    strcpy(mass, lab);

    return self;
}

- (void)setTarget:(id)obj
{
    target = obj;
}

- (void)finalize
{
    printf("%d %s\n", number, mass);
    [super finalize];
}

@end

Chunk *g = nil;
id a[2];

id *ma = nil;
id *na = nil;
void *v = kill;
//void *v = null;   // error
__weak Chunk *w[LOOP];

static void func(id *ptr)
{
    int i;
    id f;
    static id s= nil;

    f = [[Chunk alloc] initWithLabel:"Stack in func"];
    s = [[Chunk alloc] initWithLabel:"static var"];
    g = [[Chunk alloc] initWithLabel:"Global"];
    [g setTarget: [[Chunk alloc] initWithLabel:"Instance var"]];
    i = 1;
    a[i] = [[Chunk alloc] initWithLabel:"C-Style Array"];
    ma[i] = [[Chunk alloc] initWithLabel:"malloc"];
    na[i] = [[Chunk alloc] initWithLabel:"NSAlloc"];
    v = [[Chunk alloc] initWithLabel:"Void *"];
    *ptr = [[Chunk alloc] initWithLabel:"Pointer"];
    for (i = 0; i < LOOP; i++) {
        if (w[i] == nil) {
            w[i] = [[Chunk alloc] initWithLabel:"Weak Reference"];
        }
    }
}

int main(void)
{

    int i;

    ma = (id *)malloc(sizeof(id) *2);
    na = (id *)NSAllocateCollectable(sizeof(id) *2, NSScannedOption);

    for (i = 0; i < 8; i++) {
        id entry = nil;
        id m;
        m = [[Chunk alloc] initWithLabel:"Stack"];
        func(&entry);
        printf("---------\n");
        [[NSGarbageCollector defaultCollector] collectIfNeeded];
        sleep(1);
    }
    free(ma);

    return 0;
}
