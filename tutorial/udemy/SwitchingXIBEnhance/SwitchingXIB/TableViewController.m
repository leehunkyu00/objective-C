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
@synthesize tab1priceScrollView, tab1priceView;

- (void)viewDidLoad {
    NSLog(@"TableViewController (void)viewDidLoad");
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    datalist = [[NSArray alloc] initWithObjects:@"123", @"234", @"345", @"456", @"567",nil];
    
    // UIViewText for price
    priceArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i =0; i < 10; i++) {
        CGRect textViewRect = CGRectMake(125.0, 0.0+48.0*i, 100.0, 48.0);
        UITextView *uitextview = [[UITextView alloc] initWithFrame:textViewRect];
        uitextview.text = @"hello world!";
        [priceArray addObject:uitextview];
        [tab1priceView addSubview:uitextview];
    }
    
    // UIViewText for volume
    volumeArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i = 0; i < 5; i++) {
        CGRect textViewRect = CGRectMake(0.0, 0.0+48.0*i, 100.0, 48.0);
        UITextView *uitextview = [[UITextView alloc] initWithFrame:textViewRect];
        uitextview.text = @"hello world!";
        [volumeArray addObject:uitextview];
        [tab1priceView addSubview:uitextview];
    }
    for (int i = 5; i < 10; i++) {
        CGRect textViewRect = CGRectMake(250.0, 0.0+48.0*i, 100.0, 48.0);
        UITextView *uitextview = [[UITextView alloc] initWithFrame:textViewRect];
        uitextview.text = @"hello world!";
        [volumeArray addObject:uitextview];
        [tab1priceView addSubview:uitextview];
    }
    
    // UIViewText for Percent
    pricePercentArray = [[NSMutableArray alloc] initWithCapacity:0];
    for (int i =0; i < 10; i++) {
        //CGRect textViewRect = CGRectMake(125.0, 0.0+48.0*i, 100.0, 48.0);
        CGRect textViewRect = CGRectMake(200.0, 10.0+48.0*i, 50.0, 24.0);
        UITextView *uitextview = [[UITextView alloc] initWithFrame:textViewRect];
        uitextview.text = @"-10.00%";
        [uitextview setFont:[UIFont systemFontOfSize:8]];

        [pricePercentArray addObject:uitextview];
        [tab1priceView addSubview:uitextview];
    }
    
    // UIViewText for stock base price
    //CGRect stockBasePriceTextViewRect = CGRectMake(375.0, 200.0, 100.0, 48.0);
    CGRect stockBasePriceTextViewRect = CGRectMake(300.0, 10.0, 100.0, 48.0);
    stockbasePriceTextView = [[UITextView alloc] initWithFrame:stockBasePriceTextViewRect];
    stockbasePriceTextView.text =@"11111";
    [tab1priceView addSubview:stockbasePriceTextView];
    
    UITextView *stockBasePriceLabelTextView = [[UITextView alloc] initWithFrame: CGRectMake(280.0, 10.0, 20.0, 48.0)];
    stockBasePriceLabelTextView.text = @"시";
    [tab1priceView addSubview:stockBasePriceLabelTextView];
    
    // setting position for scroll view
    [tab1priceScrollView setContentOffset:CGPointMake(10.0, 140.0) animated:YES];
    //[tab1priceScrollView scrollRectToVisible:CGRectMake(100, 140, 100, 100) animated:YES];
    //tab1priceScrollView.contentOffset = CGPointMake(0, -200);

    // test for update
    //NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(update) userInfo:nil repeats:YES];
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)viewDidAppear:(BOOL)animated {
    [self.tab1priceScrollView setContentSize:CGSizeMake(0, 480)];       // setting scrollview size
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)update:(NSArray*)price andVolume:(NSArray*)volume {
    /* TODO implements*/
}

- (void)update {
    NSUInteger randValue = arc4random() % 900000;

    randValue = randValue - randValue % 1000;
    
    stockBasedPrice = randValue - 5000; // for test

    stockbasePriceTextView.text = [NSString stringWithFormat:@"%ld", (long)stockBasedPrice];
    
    for (int i = 0; i < 10; i++) {
        NSInteger currentPrice = randValue - 1000*i;
        CGFloat currentPricePercent = ((float)currentPrice - (float)stockBasedPrice)/(float)currentPrice*100.0; 
        NSLog(@"%f", currentPricePercent);
        
        UITextView *curPriceTextView = ((UITextView *)[priceArray objectAtIndex:i]);
        UITextView *curVolumeTextView = ((UITextView *)[volumeArray objectAtIndex:i]);
        UITextView *curPricePercentTextView = ((UITextView *)[pricePercentArray objectAtIndex:i]);
        //((UITextView *)[pricePercentArray objectAtIndex:i]).text = [NSString stringWithFormat:@"%lu", ];
        
        curPriceTextView.text = [NSString stringWithFormat:@"%lu", currentPrice];
        curVolumeTextView.text = [NSString stringWithFormat:@"%lu", currentPrice];  // just test
        curPricePercentTextView.text = [NSString stringWithFormat:@"%.2f%%", currentPricePercent];  // just test

        if (stockBasedPrice > currentPrice) {
            // color : blue
            [curPricePercentTextView setTextColor:[UIColor blueColor]];
            [curPriceTextView setTextColor:[UIColor blueColor]];

        } else if (stockBasedPrice < currentPrice) {
            // color : red
            [curPricePercentTextView setTextColor:[UIColor redColor]];
            [curPriceTextView setTextColor:[UIColor redColor]];
            
        } else if (stockBasedPrice == currentPrice) {
            // color : black
            [curPricePercentTextView setTextColor:[UIColor blackColor]];
            [curPriceTextView setTextColor:[UIColor blackColor]];
            
        }
        //pricePercent =    // TODO implements
//        ((UITextView *)[priceArray objectAtIndex:i]).text = randStr;
//        ((UITextView *)[volumeArray objectAtIndex:i]).text = randStr;
        //text = arc4random() % 30000;
    }
}

@end
