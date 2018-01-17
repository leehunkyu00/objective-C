//
//  ViewController.m
//  WeatherTable
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dic1 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국", @"지역", @"비", @"날씨", nil];
    NSDictionary *dic2 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국2", @"지역", @"맑음", @"날씨", nil];
    NSDictionary *dic3 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국3", @"지역", @"눈", @"날씨", nil];
    NSDictionary *dic4 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국4", @"지역", @"우박", @"날씨", nil];
    NSDictionary *dic5 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국5", @"지역", @"흐림", @"날씨", nil];
    NSDictionary *dic6 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국6", @"지역", @"비", @"날씨", nil];
    NSDictionary *dic7 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국7", @"지역", @"흐림", @"날씨", nil];
    NSDictionary *dic8 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국8", @"지역", @"비", @"날씨", nil];
    NSDictionary *dic9 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국9", @"지역", @"비", @"날씨", nil];
    NSDictionary *dic10 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국10", @"지역", @"흐림", @"날씨", nil];
    NSDictionary *dic11 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국11", @"지역", @"비", @"날씨", nil];
    NSDictionary *dic12 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국12", @"지역", @"우박", @"날씨", nil];
    NSDictionary *dic13 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국13", @"지역", @"비", @"날씨", nil];
    NSDictionary *dic14 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국14", @"지역", @"흐림", @"날씨", nil];
    NSDictionary *dic15 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국15", @"지역", @"우박", @"날씨", nil];
    NSDictionary *dic16 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국16", @"지역", @"흐림", @"날씨", nil];
    NSDictionary *dic17 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국17", @"지역", @"우박", @"날씨", nil];
    NSDictionary *dic18 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국18", @"지역", @"비", @"날씨", nil];
    NSDictionary *dic19 = [[NSDictionary alloc] initWithObjectsAndKeys:@"한국19", @"지역", @"흐림", @"날씨", nil];
    datalist = [[NSArray alloc] initWithObjects:dic1, dic2, dic3, dic4, dic5, dic6, dic7, dic8, dic9, dic10, dic11, dic12, dic13, dic14, dic15, dic16, dic17, dic18, dic19, nil];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return datalist.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // reuse cell from out range of cells.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    NSDictionary *dicTemp = [datalist objectAtIndex:indexPath.row];
    
    cell.textLabel.text = [dicTemp objectForKey:@"지역"];
    NSString *weatherStr = [dicTemp objectForKey:@"날씨"];
    cell.detailTextLabel.text = weatherStr;
    
    if ([weatherStr isEqualToString:@"맑음"]) {
        cell.imageView.image = [UIImage imageNamed:@"sunny.png"];
    } else if ([weatherStr isEqualToString:@"비"]) {
        cell.imageView.image = [UIImage imageNamed:@"rainy.png"];
    } else if ([weatherStr isEqualToString:@"흐림"]) {
        cell.imageView.image = [UIImage imageNamed:@"cloudy.png"];
    } else if ([weatherStr isEqualToString:@"눈"]) {
        cell.imageView.image = [UIImage imageNamed:@"snow.png"];
    } else {
        cell.imageView.image = [UIImage imageNamed:@"blizzard.png"];
    }

    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
