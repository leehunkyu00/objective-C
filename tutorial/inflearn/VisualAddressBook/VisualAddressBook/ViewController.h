//
//  ViewController.h
//  VisualAddressBook
//
//  Created by hklee on 2018. 1. 9..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BookManager;
@interface ViewController : UIViewController {
    BookManager *myBook;
}

// IB = interface builder
@property (nonatomic, strong) IBOutlet UITextView *resultTextView;
@property (nonatomic, strong) IBOutlet UITextField *nameTextField;
@property (nonatomic, strong) IBOutlet UITextField *genreTextField;
@property (nonatomic, strong) IBOutlet UITextField *authorTextField;
@property (nonatomic, strong) IBOutlet UILabel *countLabel;

-(IBAction)showAllBookAction:(id)sender;
-(IBAction)addBookcAction:(id)sender;
-(IBAction)findBookAction:(id)sender;
-(IBAction)removeBookAction:(id)sender;

@end

