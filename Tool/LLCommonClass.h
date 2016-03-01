//
//  LLCommonClass.h
//  Lalocal
//
//  Created by LinfangTu on 16/1/5.
//  Copyright © 2016年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//

/**
 *  通用的工具类，写于此
 */

#import <Foundation/Foundation.h>
#import "LLTargetModel.h"

@interface LLCommonClass : NSObject

/**
 *  md5加密
 *
 *  @param input 原字符串
 *
 *  @return 加密后的字符串
 */
+ (NSString *)md5HexDigest:(NSString *)input;

/**
 *  获取文件夹得大小
 *
 *  @param path 路劲
 *
 *  @return 返回大小
 */
+ (NSUInteger)fileSizeAtPath:(NSString *)path;

/**
 *  http 链接解析
 *
 *  @param urlString url
 *
 *  @return 解析结果
 */
+ (LLTargetModel *)parsingActivityURL:(NSString *)urlString;


/**
 *  图片压缩 750*560
 *
 *  @param urlStr url字符串
 *
 *  @return url
 */
+ (NSURL *)articleImageMogrWithUrlString:(NSString *)urlStr;

/**
 *  图片压缩 702*629
 *
 *  @param urlStr url字符串
 *
 *  @return url
 */
+ (NSURL *)illustratedImageMogrWithUrlString:(NSString *)urlStr;

/**
 *  图片压缩 702*390
 *
 *  @param urlStr url字符串
 *
 *  @return url
 */
+ (NSURL *)productImageMogrWithUrlString:(NSString *)urlStr;


@end
