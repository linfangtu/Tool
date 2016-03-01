//
//  CALayer+Addition.m
//  Lalocal
//
//  Created by LinfangTu on 16/2/16.
//  Copyright © 2016年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//

#import "CALayer+Addition.h"
#import <objc/runtime.h>

@implementation CALayer (Addition)

- (UIColor *)borderColorFromUIColor {
    return objc_getAssociatedObject(self, @selector(borderColorFromUIColor));
}

-(void)setBorderColorFromUIColor:(UIColor *)color {
    objc_setAssociatedObject(self, @selector(borderColorFromUIColor), color, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self setBorderColorFromUI:self.borderColorFromUIColor];
}

- (void)setBorderColorFromUI:(UIColor *)color {
    self.borderColor = color.CGColor;
}

@end
