//
//  MasterViewController.m
//  CustomCell
//
//  Created by hklee on 2018. 1. 15..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "MasterViewController.h"
#import "CustomCell.h"
#import "DetailViewController.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *item1=[[NSDictionary alloc]initWithObjectsAndKeys:@"사과",@"name",@"apple.jpeg",@"image",@"6",@"amount",@"3000원",@"value",nil];
    NSDictionary *item2=[[NSDictionary alloc]initWithObjectsAndKeys:@"블루베리",@"name",@"blueberry.jpg",@"image",@"10",@"amount",@"30000원",@"value",nil];
    NSDictionary *item3=[[NSDictionary alloc]initWithObjectsAndKeys:@"당근",@"name",@"carrot.jpg",@"image",@"13",@"amount",@"5000원",@"value",nil];
    NSDictionary *item4=[[NSDictionary alloc]initWithObjectsAndKeys:@"체리",@"name",@"cherry.png",@"image",@"1",@"amount",@"2000원",@"value",nil];
    NSDictionary *item5=[[NSDictionary alloc]initWithObjectsAndKeys:@"포도",@"name",@"grape.jpg",@"image",@"13",@"amount",@"1000원",@"value",nil];
    NSDictionary *item6=[[NSDictionary alloc]initWithObjectsAndKeys:@"키위",@"name",@"kiwi.png",@"image",@"2",@"amount",@"15000원",@"value",nil];
    NSDictionary *item7=[[NSDictionary alloc]initWithObjectsAndKeys:@"레몬",@"name",@"lemon.png",@"image",@"3",@"amount",@"6000원",@"value",nil];
    NSDictionary *item8=[[NSDictionary alloc]initWithObjectsAndKeys:@"라임",@"name",@"lime.jpg",@"image",@"4",@"amount",@"4000원",@"value",nil];
    NSDictionary *item9=[[NSDictionary alloc]initWithObjectsAndKeys:@"고기",@"name",@"meat.jpg",@"image",@"5",@"amount",@"2000원",@"value",nil];
    NSDictionary *item10=[[NSDictionary alloc]initWithObjectsAndKeys:@"딸기",@"name",@"strawberry.jpg",@"image",@"7",@"amount",@"8000원",@"value",nil];
    NSDictionary *item11=[[NSDictionary alloc]initWithObjectsAndKeys:@"토마토",@"name",@"tomato.png",@"image",@"30",@"amount",@"3000원",@"value",nil];
    NSDictionary *item12=[[NSDictionary alloc]initWithObjectsAndKeys:@"야채",@"name",@"vegetable.jpg",@"image",@"40",@"amount",@"7000원",@"value",nil];
    NSDictionary *item13=[[NSDictionary alloc]initWithObjectsAndKeys:@"멜론",@"name",@"watermelon.png",@"image",@"5",@"amount",@"10000원",@"value",nil];
    
    itemList = [[NSArray alloc]initWithObjects:item1,item2,item3,item4,item5,item6,item7,item8,item9,item10,item11,item12,item13,nil];
    
    // table view background
    UIImageView *backgroundImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background.jpg"]];
    backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    backgroundImageView.frame = self.tableView.frame;
    
    self.tableView.backgroundView = backgroundImageView;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return itemList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Hello" forIndexPath:indexPath];
    
    NSDictionary *dicTemp = [itemList objectAtIndex:indexPath.row];
    
    cell.nameLabel.text = [dicTemp objectForKey:@"name"];
    cell.amountLabel.text = [dicTemp objectForKey:@"amount"];
    cell.valueLabel.text = [dicTemp objectForKey:@"value"];
    
    cell.imgView.image = [UIImage imageNamed:[dicTemp objectForKey:@"image"]];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString: @"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailData:[itemList objectAtIndex:indexPath.row]];
        
    }
}

@end
