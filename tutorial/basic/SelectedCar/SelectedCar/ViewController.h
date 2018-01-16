//
//  ViewController.h
//  SelectedCar
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate> {
    NSArray *companyName;
    
    NSArray *carModel;
    NSArray *carModelImage;
    
    NSArray *tesla;
    NSArray *teslaImageNames;
    
    NSArray *lamborghini;
    NSArray *lamborghiniImageName;
    
    NSArray *porsche;
    NSArray *porscheImageName;
}

@property (strong, nonatomic) IBOutlet UIImageView *imgView;


@end

