//
//  ViewController.h
//  XMLParsing
//
//  Created by hklee on 2018. 1. 16..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSXMLParserDelegate, UITableViewDataSource, UITableViewDelegate> {
    NSDictionary *datalist;
    NSArray *local;
    
}


@end

