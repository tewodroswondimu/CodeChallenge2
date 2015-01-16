//
//  WebViewController.m
//  CodeChallenge2
//
//  Created by Tewodros Wondimu on 1/16/15.
//  Copyright (c) 2015 MobileMakers. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.spinner.hidden = YES;
    self.webView.delegate = self;
    [self loadWebPageWithAddress:self.url];
}

- (void)loadWebPageWithAddress:(NSString *)addressString
{
    NSURL *addressURL = [NSURL URLWithString:addressString];
    NSURLRequest *addressRequest = [NSURLRequest requestWithURL:addressURL];
    [self.webView loadRequest:addressRequest];
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.spinner.hidden = NO;
    [self.spinner startAnimating];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self.spinner stopAnimating];
    self.spinner.hidden = YES;
}

- (IBAction)onCloseButtonTapped:(UIButton *)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
