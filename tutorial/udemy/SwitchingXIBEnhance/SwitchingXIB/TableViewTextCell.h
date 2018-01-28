//
//  TableViewTextCell.h
//  SwitchingXIB
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewTextCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *textCell;

- (void)setText:(NSString *)text;

@end
