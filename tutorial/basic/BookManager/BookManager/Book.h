//
//  Book.h
//  BookManager
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Book : NSObject

// atom is default value but slow
// strong ref(default)
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *genre;
@property (nonatomic, strong) NSString *author;

-(void)bookPrint;
@end
