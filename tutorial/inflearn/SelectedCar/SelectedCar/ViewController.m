//
//  ViewController.m
//  SelectedCar
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize imgView;

- (void)viewDidLoad {
    [super viewDidLoad];
    companyName = [[NSArray alloc] initWithObjects:@"테슬라", @"람보르기니", @"포르쉐", nil];
    carModel = [[NSArray alloc] init];
    carModelImage = [[NSArray alloc] init];
    
    tesla = [[NSArray alloc]initWithObjects:@"모델S", @"모델X", nil];
    teslaImageNames = [[NSArray alloc]initWithObjects:@"tesla-model-s.jpg", @"tesla-model-x.jpg", nil];
    
    lamborghini = [[NSArray alloc]initWithObjects:@"lambo-1", @"lambo-2", @"lambo-3", nil];
    lamborghiniImageName = [[NSArray alloc]initWithObjects:@"lamborghini-veneno.jpg", @"lamborghini-huracan.jpg", @"lamborghini-aventador.jpg", nil];
  
    porsche = [[NSArray alloc]initWithObjects:@"porsche-1", @"porsche-2", nil];
    porscheImageName = [[NSArray alloc]initWithObjects:@"porsche-911.jpg", @"porsche-boxter.jpg", nil];
    
    carModel = tesla;
    carModelImage = teslaImageNames;
    
    imgView.layer.cornerRadius = 50.0;
    imgView.layer.masksToBounds = YES;
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 2;   // component count
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 70.0;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    if (component == 0) {
        return 140.0;
    } else {
        return 200.0;
    }
}


-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component == 0) {
        return companyName.count;
    } else {
        return carModel.count;
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    if (component == 0) {
        return [companyName objectAtIndex:row];
    } else {
        return [carModelImage objectAtIndex:row];
    }
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (component == 0 && row == 0) {
        carModel = tesla;
        carModelImage = teslaImageNames;
    } else if (component == 0 && row == 1) {
        carModel = lamborghini;
        carModelImage = lamborghiniImageName;
    } else if (component == 0 && row == 2) {
        carModel = porsche;
        carModelImage = porscheImageName;
    }
    
    [pickerView reloadAllComponents];
    
    imgView.image = [UIImage imageNamed:[carModelImage objectAtIndex:[pickerView selectedRowInComponent:1]]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
