//
//  AgreementView.m
//  DHSeller
//
//  Created by Ios_Developer on 2017/12/21.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import "AgreementView.h"
#import <WebKit/WebKit.h>
@interface AgreementView()<WKNavigationDelegate>

@property (nonatomic ,strong)WKWebView *webView;
@end
@implementation AgreementView

-(instancetype)initWithFrame:(CGRect)frame withFileName:(NSString *)fileName withHtmlStr:(NSString *)htmlStr
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        
        self.webView = [[WKWebView alloc] initWithFrame:frame];
        self.webView.scrollView.bounces = NO;
        self.webView.navigationDelegate = self;
        [self addSubview:self.webView];
        
        if (fileName)
        {
            NSString * str = [[NSBundle mainBundle] pathForResource:fileName ofType:@"html"];
            NSURL * url = [NSURL fileURLWithPath:str];
            [self.webView loadHTMLString:[[NSString alloc] initWithContentsOfFile:str encoding:NSUTF8StringEncoding error:nil] baseURL:url];
        }
        else
        {
             [self.webView loadHTMLString:[self htmlEntityDecode:htmlStr] baseURL:nil];
        }
    }
    return self;
}
#pragma mark =====  webview delegate  =====
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD showHUDAddedTo:self animated:YES];
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD hideHUDForView:self animated:YES];
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD hideHUDForView:self animated:YES];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    [MBProgressHUD hideHUDForView:self animated:YES];
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
