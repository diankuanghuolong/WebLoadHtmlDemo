//
//  AgreementView.h
//  DHSeller
//
//  Created by Ios_Developer on 2017/12/21.
//  Copyright © 2017年 panzhow. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AgreementView : UIView

-(instancetype)initWithFrame:(CGRect)frame withFileName:(NSString *)fileName withHtmlStr:(NSString *)htmlStr;// 1通过本地html文件加载  2 通过html字符串加载
@end
