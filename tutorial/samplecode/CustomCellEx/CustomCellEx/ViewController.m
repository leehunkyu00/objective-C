
#import "ViewController.h"
#import "CustomCell.h"
#import "Product.h"
#define CELL_ID @"CELL_ID"

@implementation ViewController
@synthesize products;

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [products count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CustomCell *cell = (CustomCell *) [tableView dequeueReusableCellWithIdentifier:CELL_ID];
    
    if( nil == cell ) {
        //하나의 xib에 여러개의 Table View Cell을 올려놓고 정의 할 수 있다. 
        //그렇기 때문에 array형태로 가져오게 되며, 현재는 xib한개의 Table View Cell만 정의 함으로
        //0번째 인덱스의 Table View Cell을 가져오면 된다.
        NSArray *array = [[NSBundle mainBundle]loadNibNamed:@"CustomCell" owner:nil options:nil];
        cell = [array objectAtIndex:0];
    }
    
    [cell setProduct:[products objectAtIndex:indexPath.row]];
    
    return cell;
}

//셀 높이를 반환하는 delegate method
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    products = [[NSMutableArray alloc]initWithCapacity:5];
    [products addObject:[Product product:@"iPad" price:@"699$" imageName:@"ipad.png"]];
    [products addObject:[Product product:@"iMac" price:@"1199$" imageName:@"imac.png"]];
    [products addObject:[Product product:@"iPhone" price:@"699$" imageName:@"iphone.png"]];
    [products addObject:[Product product:@"MacBook" price:@"999$" imageName:@"macbook.png"]];
    [products addObject:[Product product:@"iPod Touch" price:@"299$" imageName:@"ipod-touch.png"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}
- (void)dealloc {
    [products release];
    [super dealloc];
}

- (void)viewDidUnload
{

    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
