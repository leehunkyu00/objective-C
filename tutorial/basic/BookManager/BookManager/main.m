//
//  main.m
//  BookManager
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Book.h"
#import "BookManager.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Book
        // BookManager
        Book *book1 = [[Book alloc] init];
        book1.name = @"ham1";
        book1.genre = @"sad1";
        book1.author = @"aaa1";
        
        Book *book2 = [[Book alloc] init];
        book2.name = @"ham2";
        book2.genre = @"sad2";
        book2.author = @"aaa2";
        
        Book *book3 = [[Book alloc] init];
        book3.name = @"ham3";
        book3.genre = @"sad3";
        book3.author = @"aaa3";
        
//        [book1 bookPrint];
//        [book2 bookPrint];
//        [book3 bookPrint];
        
        BookManager *myBook = [[BookManager alloc] init];
        [myBook addBook:book1];
        [myBook addBook:book2];
        [myBook addBook:book3];
        
        NSLog(@"%@", [myBook showAllBook]);
        
        NSLog(@"count : %li", [myBook countBook]);
        
        NSString *strTemp = [myBook findBook:@"ham2"];
        if (strTemp != nil) {
            NSLog(@"%@", strTemp);
        } else {
            NSLog(@"Not exist name");
        }
        
        NSString *removeResult = [myBook removeBook:@"ham2"];
        if (removeResult != nil) {
            NSLog(@"remove : %@", removeResult);
        } else {
            NSLog(@"Not exist name");
        }
        
        NSLog(@"%@", [myBook showAllBook]);
        NSLog(@"count : %li", [myBook countBook]);
    }
    return 0;
}
