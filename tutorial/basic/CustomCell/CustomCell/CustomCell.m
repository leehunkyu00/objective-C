//
//  CustomCell.m
//  CustomCell
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize imgView, nameLabel, valueLabel, amountLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    imgView.layer.cornerRadius = 50.0;
    imgView.layer.masksToBounds = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
