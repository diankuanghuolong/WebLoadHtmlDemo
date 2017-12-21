//
//  AgreementWebVC.h
//  DHSeller
//
//  Created by Ios_Developer on 2017/12/21.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgreementWebVC : UIViewController
@property(nonatomic,strong)NSString * fileName;//通过本地文件加载
@property (nonatomic ,strong)NSString *htmlStr;//通过html字符串加载
@end
