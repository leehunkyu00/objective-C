//
//  ViewController.m
//  VisualAddressBook
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"
#import "BookManager.h"
#import "Book.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize resultTextView;
@synthesize nameTextField, genreTextField,  authorTextField;
@synthesize countLabel;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Book *book1 = [[Book alloc] init];
    book1.name = @"ham1";
    book1.genre = @"sad1";
    book1.author = @"aaa1";
    
    Book *book2 = [[Book alloc] init];
    book2.name = @"ham2";
    book2.genre = @"sad2";
    book2.author = @"aaa2";
    
    Book *book3 = [[Book alloc] init];
    book3.name = @"ham3";
    book3.genre = @"sad3";
    book3.author = @"aaa3";
    
    //        [book1 bookPrint];
    //        [book2 bookPrint];
    //        [book3 bookPrint];
    
    myBook = [[BookManager alloc] init];
    
    [myBook addBook:book1];
    [myBook addBook:book2];
    [myBook addBook:book3];
    
    countLabel.text = [NSString stringWithFormat:@"%li", [myBook countBook]];
}

- (void)showAllBookAction:(id)sender {
    //NSLog(@"%@", [myBook showAllBook]);
    resultTextView.text = [myBook showAllBook];
    //[resultTextView setText:[myBook showAllBook]];
}

-(IBAction)addBookcAction:(id)sender {
    Book *bookTemp = [[Book alloc] init];
    bookTemp.name = nameTextField.text;
    bookTemp.genre = genreTextField.text;
    bookTemp.author = authorTextField.text;
    
    [myBook addBook:bookTemp];
    resultTextView.text = @"Added book!";
    
    countLabel.text = [NSString stringWithFormat:@"%li", [myBook countBook]];
}

-(IBAction)findBookAction:(id)sender {
    NSString *strTemp = [myBook findBook:nameTextField.text];
    if (strTemp != nil) {
        resultTextView.text = strTemp;
    } else {
        resultTextView.text = @"찾으시는 책이 없네요";
    }
}

-(IBAction)removeBookAction:(id)sender {
    NSString *strTemp = [myBook removeBook:nameTextField.text];
    if (strTemp != nil) {
        NSMutableString *mstr = [[NSMutableString alloc] initWithString:strTemp];
        [mstr appendString:@"책이 지워졌습니다"];
        resultTextView.text = mstr;
    } else {
        resultTextView.text = @"지울려는 책이 없네요";
    }
    
    countLabel.text = [NSString stringWithFormat:@"%li", [myBook countBook]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
