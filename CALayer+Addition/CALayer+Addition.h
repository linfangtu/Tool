//
//  CALayer+Addition.h
//  Lalocal
//
//  Created by LinfangTu on 16/2/16.
//  Copyright © 2016年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//

//storyboard 设置边框颜色
#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface CALayer (Addition)

@property(nonatomic, strong) UIColor *borderColorFromUIColor;
- (void)setBorderColorFromUIColor:(UIColor *)color;

@end
