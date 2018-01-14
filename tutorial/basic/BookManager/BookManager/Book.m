//
//  Book.m
//  BookManager
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "Book.h"

@implementation Book
@synthesize name, genre, author;

-(void)bookPrint
{
    NSLog(@"Name : %@", name);
    NSLog(@"Genre : %@", genre);
    NSLog(@"author : %@", author);
}

@end
