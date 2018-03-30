//
//  AgreementWebVC.m
//  WebLoadHtmlDemo
//
//  Created by Ios_Developer on 2017/12/21.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "AgreementWebVC.h"
#import <WebKit/WebKit.h>
@interface AgreementWebVC ()<WKNavigationDelegate>

@property (nonatomic ,strong)WKWebView *webView;
@end

@implementation AgreementWebVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    self.webView.scrollView.bounces = NO;
    self.webView.navigationDelegate = self;
    [self.view addSubview:self.webView];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (self.fileName)
    {
        NSString * str = [[NSBundle mainBundle] pathForResource:self.fileName ofType:@"html"];
        NSURL * url = [NSURL fileURLWithPath:str];
        [self.webView loadHTMLString:[[NSString alloc] initWithContentsOfFile:str encoding:NSUTF8StringEncoding error:nil] baseURL:url];
    }
    else
    {
        [self.webView loadHTMLString:[self htmlEntityDecode:self.htmlStr] baseURL:nil];
    }
}
#pragma mark =====  webview delegate  =====
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];
    NSLog(@"%s",__func__);
}

#pragma mark =====  tool  =====
- (NSString *)htmlEntityDecode:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"&quot;" withString:@"\""];
    string = [string stringByReplacingOccurrencesOfString:@"&apos;" withString:@"'"];
    string = [string stringByReplacingOccurrencesOfString:@"&lt;" withString:@"<"];
    string = [string stringByReplacingOccurrencesOfString:@"&gt;" withString:@">"];
    string = [string stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"]; // Do this last so that, e.g. @"&amp;lt;" goes to @"&lt;" not @"<"
    
    return string;
}

@end
