//
//  TableViewTextCell.m
//  SwitchingXIB
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "TableViewTextCell.h"

@implementation TableViewTextCell
@synthesize textCell;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setText:(NSString *)text {
    //self.textCell.text = text;
    //self.textCell.text = text;
    self.textCell.text = [[NSString alloc] initWithString:text];
    NSLog(@"setText : %@", self.textCell.text);
}
@end
