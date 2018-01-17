//
//  ViewController.h
//  ImageDownload
//
//  Created by hklee on 2018. 1. 16..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <NSURLSessionDownloadDelegate> {
    NSURLSessionTask *downloadTask;
}

@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicatorView;
@property (strong, nonatomic) IBOutlet UIProgressView *downloadProgressView;
- (IBAction)downloadAction:(id)sender;
- (IBAction)suspendAction:(id)sender;
- (IBAction)resumeAction:(id)sender;
- (IBAction)cancelAction:(id)sender;

@end

