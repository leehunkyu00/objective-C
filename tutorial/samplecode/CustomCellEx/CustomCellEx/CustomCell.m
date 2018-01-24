//
//  CustomCell.m
//  CustomCellEx
//
//  Created by 근재 전 on 11. 11. 19..
//  Copyright (c) 2011년 __MyCompanyName__. All rights reserved.
//

#import "CustomCell.h"
#import "Product.h"

@implementation CustomCell
@synthesize productImage;
@synthesize productName;
@synthesize productPrice;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setProduct:(Product *)product {
    self.productImage.image = [product productImage];
    self.productName.text = [product productName];
    self.productPrice.text = [product productPrice];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc {
    [productImage release];
    [productName release];
    [productPrice release];
    [super dealloc];
}
- (IBAction)addCart:(id)sender {
}
@end
