//
//  ViewController.m
//  WebLoadHtmlDemo
//
//  Created by Ios_Developer on 2017/12/21.
//  Copyright © 2017年 hai. All rights reserved.
//

#import "ViewController.h"
#import "AgreementWebVC.h"
#import "AgreementView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *webBtn  = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 40)];
    [webBtn setTitle:@"web加载" forState:UIControlStateNormal];
    [webBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    webBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [webBtn addTarget:self action:@selector(showInWebVC) forControlEvents:UIControlEventTouchUpInside];
    webBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:webBtn];
    
    
    UIButton *viewBtn  = [[UIButton alloc] initWithFrame:CGRectMake(100, 150, 100, 40)];
    [viewBtn setTitle:@"view加载" forState:UIControlStateNormal];
    [viewBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    viewBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [viewBtn addTarget:self action:@selector(showInView) forControlEvents:UIControlEventTouchUpInside];
    viewBtn.backgroundColor = [UIColor grayColor];
    [self.view addSubview:viewBtn];
}


#pragma mark ===== action  =====
-(void)showInWebVC
{
     NSString *htmlStr = @"<!doctypehtml><html><head><metacharset='utf-8'/></head><body><p>&nbsp;&nbsp;&nbsp;&nbsp;唯有工作，能使我快乐。<br><p>&nbsp;&nbsp;&nbsp;&nbsp;为了防止世界给破坏，为了维护宇宙的和平</h3><br><p><br>一：<br><p>&nbsp;&nbsp;&nbsp;&nbsp;逍遥之人爱逍遥，任他千枷百锁，我自狂歌依旧。<br></p><body></html>";
        AgreementWebVC *agreeVC = [AgreementWebVC new];
        agreeVC.fileName = @"hai";
//        agreeVC.htmlStr = htmlStr;
        [self.navigationController pushViewController:agreeVC animated:YES];
}
-(void)showInView
{
     NSString *htmlStr = @"<!doctypehtml><html><head><metacharset='utf-8'/></head><body><p>&nbsp;&nbsp;&nbsp;&nbsp;唯有工作，能使我快乐。<br><p>&nbsp;&nbsp;&nbsp;&nbsp;为了防止世界给破坏，为了维护宇宙的和平</h3><br><p><br>一：<br><p>&nbsp;&nbsp;&nbsp;&nbsp;逍遥之人爱逍遥，任他千枷百锁，我自狂歌依旧。<br></p><body></html>";
    AgreementView *agreView = [[AgreementView alloc] initWithFrame:CGRectMake(0, SafeAreaTopHeight, SCREEN_WIDTH, SCREEN_HEIGHT -SafeAreaTopHeight - SafeAreaBottomHeight) withFileName:nil withHtmlStr:htmlStr];
    [self.view addSubview:agreView];

}


@end
