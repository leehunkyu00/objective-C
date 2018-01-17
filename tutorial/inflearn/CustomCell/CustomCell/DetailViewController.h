//
//  DetailViewController.h
//  CustomCell
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) NSDictionary *detailData;

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) IBOutlet UILabel *valueLabel;

@end
