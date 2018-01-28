//
//  TableViewController.h
//  SwitchingXIB
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
    NSArray *datalist;
}

@end
