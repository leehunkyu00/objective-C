//
//  TableViewController.m
//  SwitchingXIB
//
//  Created by hklee on 2018. 1. 24..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewTextCell.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    NSLog(@"TableViewController (void)viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    datalist = [[NSArray alloc] initWithObjects:@"123", @"234", @"345", @"456", @"567",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSLog(@"(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath");
    return [datalist count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath");
    static NSString *identifier = @"PriceCell";
    
    TableViewTextCell *cell;
    cell = (TableViewTextCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        NSLog(@"CELL IS EMPTY");
        /*
        NSArray *array = [[NSBundle mainBundle] loadNibNamed:@"TableViewTextCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
        */
        /*
        [[NSBundle mainBundle] loadNibNamed:@"TableViewTextCell" owner:nil options:nil];
        cell = _tableViewTextCell;
        */
        //cell = [[TableViewTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //cell = [[TableViewTextCell alloc] init];
    } else {
        NSLog(@"CELL REUSE!");
    }
    /*
    UILabel *mylabel = [[UILabel alloc] initWithFrame:CGRectMake(35,13, 230, 30)];
    [cell.contentView addSubview:mylabel];
    mylabel.text = @"Hello";
    */

    [cell setText:[datalist objectAtIndex:indexPath.row]];
    
//    cell = [[TableViewTextCell alloc] init];
//    [cell setText:datalist[indexPath.row]];
    
    return cell;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
