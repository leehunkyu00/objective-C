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
    
    datalist = [[NSMutableArray alloc] init];

    parser = [[NSXMLParser alloc] initWithContentsOfURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"]];
    parser.delegate = self;
    [parser parse];
    NSLog(@"%@", datalist);
}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    NSLog(@"didStartElement : %@", elementName);
    if ([elementName isEqualToString:@"local"]) {
        detailData = [[NSMutableDictionary alloc] init];
    }
    // element is key
    elementTemp = elementName;
    blank = YES;
}

-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (blank == YES && ![elementTemp isEqualToString:@"local"]) {
        // string is value
        NSLog(@"foundCharacters : %@", string);
        [detailData setObject:string forKey:elementTemp];
    }
}

-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"didEndElement : %@", elementName);
    if ([elementName isEqualToString:@"local"]) {
        // insert array
        [datalist addObject:detailData];
    }
    blank = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return datalist.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"weather" forIndexPath:indexPath];
    
    NSDictionary *dicTmp = [datalist objectAtIndex:indexPath.row];
    
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
