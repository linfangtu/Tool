//
//  LLSizeAdapter.h
//  Lalocal
//
//  Created by LinfangTu on 15/12/26.
//  Copyright © 2015年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LLSizeAdapter : NSObject

+ (LLSizeAdapter *)sharedAdapter;

/**
 *  iPhone 6+ 宽度适配
 *
 *  @param width 6的设计宽度
 *
 *  @return 6+的尺寸
 */
- (CGFloat)AdaptedWidthValue:(CGFloat)width;

/**
 *  iPhone 6+ 高度适配
 *
 *  @param height 6的设计高度
 *
 *  @return 6+的高度
 */
- (CGFloat)AdaptedHeightValue:(CGFloat)height;

@end
