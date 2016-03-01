//
//  LLSizeAdapter.m
//  Lalocal
//
//  Created by LinfangTu on 15/12/26.
//  Copyright © 2015年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//

#import "LLSizeAdapter.h"
#import "SettingConfig.h"

@implementation LLSizeAdapter

+ (LLSizeAdapter *)sharedAdapter {
    static LLSizeAdapter *sharedAdapter = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAdapter = [[self alloc] init];
    });
    return sharedAdapter;

}

- (CGFloat)AdaptedWidthValue:(CGFloat)width {
    if (iPhone6plus) {
        return AdaptedWidthValue(width);
    }
    else {
        return width;
    }
}

- (CGFloat)AdaptedHeightValue:(CGFloat)height {
    if (iPhone6plus) {
        return AdaptedHeightValue(height);
    }
    else {
        return height;
    }
}

@end
