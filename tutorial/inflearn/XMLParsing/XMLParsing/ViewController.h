//
//  ViewController.h
//  XMLParsing
//
//  Created by hklee on 2018. 1. 16..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSXMLParserDelegate, UITableViewDataSource, UITableViewDelegate> {
    NSXMLParser *parser;
    
    NSMutableArray *datalist;
    NSMutableDictionary *detailData;
    
    BOOL blank;
    
    NSString *elementTemp;
}


@end

