//
//  BookManager.m
//  BookManager
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "BookManager.h"
#import "Book.h"

@implementation BookManager

- (instancetype)init {
    self = [super init];
    if (self) {
        // Initialize self
        bookList = [[NSMutableArray alloc] init];
    }
    return self;
}

-(void)addBook:(Book *)bookObject
{
    [bookList addObject:bookObject];
}

-(NSString *)showAllBook
{
    NSMutableString *strTmp = [[NSMutableString alloc] init];
    for (Book *bookTmp in bookList) {
        [strTmp appendString:@"Name : "];
        [strTmp appendString:bookTmp.name];
        [strTmp appendString:@"\n"];
        [strTmp appendString:@"Genre : "];
        [strTmp appendString:bookTmp.genre];
        [strTmp appendString:@"\n"];
        [strTmp appendString:@"Author : "];
        [strTmp appendString:bookTmp.author];
        [strTmp appendString:@"\n"];
        [strTmp appendString:@"----------"];
        [strTmp appendString:@"\n"];
    }
    return strTmp;
}

-(NSUInteger)countBook
{
    return [bookList count];
}

-(NSString *)findBook:(NSString *)name
{
    NSMutableString *strTmp = [[NSMutableString alloc] init];
    for (Book *bookTmp in bookList) {
        if ([bookTmp.name isEqualToString:name]) {
            
            [strTmp appendString:@"Name : "];
            [strTmp appendString:bookTmp.name];
            [strTmp appendString:@"\n"];
            [strTmp appendString:@"Genre : "];
            [strTmp appendString:bookTmp.genre];
            [strTmp appendString:@"\n"];
            [strTmp appendString:@"Author : "];
            [strTmp appendString:bookTmp.author];
            return strTmp;
        }
    }
    return nil;
}

-(NSString *)removeBook:(NSString *)name
{
    NSMutableString *strTmp = [[NSMutableString alloc] init];
    for (Book *bookTmp in bookList) {
        if ([bookTmp.name isEqualToString:name]) {
            
            [bookList removeObject:bookTmp];
            return name;
        }
    }
    return nil;
}
@end
