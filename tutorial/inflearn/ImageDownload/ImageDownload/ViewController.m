//
//  ViewController.m
//  ImageDownload
//
//  Created by hklee on 2018. 1. 16..
//  Copyright © 2018년 hklee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize activityIndicatorView, downloadProgressView, imgView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [downloadProgressView setProgress:0.0 animated:NO];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)downloadAction:(id)sender {
    imgView.image = nil;
    [downloadProgressView setProgress:0.0 animated:NO];
    [activityIndicatorView startAnimating];
    NSURLSessionConfiguration *sessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfiguration delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    
    downloadTask = [session downloadTaskWithURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/sample.jpeg"]];

    [downloadTask resume];
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
    
//    // total byte
//    NSLog(@"totalBytesExpectedToWrite: %lli", totalBytesExpectedToWrite);
//    // get byte
//    NSLog(@"bytesWritten : %lli", bytesWritten);
//    // sum byte
//    NSLog(@"bytesWritten : %lli", totalBytesWritten);
    
    float progress = (float)totalBytesWritten/(float)totalBytesExpectedToWrite;
    [downloadProgressView setProgress:progress animated:YES];
    
}

// require method
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
    
    NSData *data = [NSData dataWithContentsOfURL:location];
    imgView.image = [UIImage imageWithData:data];
    [activityIndicatorView stopAnimating];
}


- (IBAction)suspendAction:(id)sender {
    [downloadTask suspend];
}

- (IBAction)resumeAction:(id)sender {
    [downloadTask resume];
}

- (IBAction)cancelAction:(id)sender {
    [downloadTask cancel];
    [downloadProgressView setProgress:0.0 animated:NO];
    [activityIndicatorView stopAnimating];
}
@end
