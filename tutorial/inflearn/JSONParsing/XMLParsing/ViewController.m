//
//  ViewController.m
//  XMLParsing
//
//  Created by hklee on 2018. 1. 16..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"
#import "WeatherCell.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *err;
    
    datalist = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.json"]] options:NSJSONReadingAllowFragments error:&err];
    //NSLog(@"%@", detail); // dictionary

    local = [[datalist objectForKey:@"weatherinfo"] objectForKey:@"local"];
    NSLog(@"%@", local);    // array
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return local.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weather" forIndexPath:indexPath];
    
    NSDictionary *dicTmp = [local objectAtIndex:indexPath.row];

    cell.countryLabel.text = [dicTmp objectForKey:@"country"];
    NSString *weatherStr = [dicTmp objectForKey:@"weather"];
    cell.weatherLabel.text = weatherStr;
    cell.temperatureLabel.text = [dicTmp objectForKey:@"temperature"];

    if ([weatherStr isEqualToString:@"맑음"]) {
        cell.imgView.image = [UIImage imageNamed:@"sunny.png"];
    } else if ([weatherStr isEqualToString:@"비"]) {
        cell.imgView.image = [UIImage imageNamed:@"rainy.png"];
    } else if ([weatherStr isEqualToString:@"흐림"]) {
        cell.imgView.image = [UIImage imageNamed:@"cloudy.png"];
    } else if ([weatherStr isEqualToString:@"눈"]) {
        cell.imgView.image = [UIImage imageNamed:@"snow.png"];
    } else {
        cell.imgView.image = [UIImage imageNamed:@"blizzard.png"];
    }

    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// cell height
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150.0;
}
@end
