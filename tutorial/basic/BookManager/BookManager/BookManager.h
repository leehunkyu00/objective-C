//
//  BookManager.h
//  BookManager
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>

// sample
// a<-b<-c<-a , circular error
@class Book;
@interface BookManager : NSObject
{
    NSMutableArray *bookList;
}

-(void)addBook:(Book *)bookObject;
-(NSString *)showAllBook;
-(NSUInteger)countBook;
-(NSString *)findBook:(NSString *)name;
-(NSString *)removeBook:(NSString *)name;

@end
