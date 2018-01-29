//
//  TableViewController.h
//  SwitchingXIB
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController {
    NSArray *datalist;
    NSMutableArray *priceArray;         // in UITextView *
    NSMutableArray *volumeArray;        // in UITextView *
    NSMutableArray *pricePercentArray;  // in UITextView *
    UITextView *stockbasePriceTextView;
    
    NSInteger stockBasedPrice;
}
@property (strong, nonatomic) IBOutlet UIScrollView *tab1priceScrollView;
@property (strong, nonatomic) IBOutlet UIView *tab1priceView;

- (void)update:(NSArray*)price andVolume:(NSArray*)volume;

@end
