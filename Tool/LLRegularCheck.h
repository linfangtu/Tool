//
//  LLRegularCheck.h
//  Lalocal
//
//  Created by LinfangTu on 16/1/5.
//  Copyright © 2016年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//


/**
 *  所有正则校验，写于此类
 */


#import <Foundation/Foundation.h>

@interface LLRegularCheck : NSObject

/**
 *  邮箱校验
 *
 *  @param email 邮箱参数
 *
 *  @return 符合邮箱规则返回YES，否则返回NO
 */
+ (BOOL)validateEmail:(NSString *)email;

/**
 *  密码正则校验
 *
 *  @param password 参数
 *
 *  @return 符合要求返回YES，否则返回NO
 */
+ (BOOL)validatePassword:(NSString *)password;

/**
 *  中文校验
 *
 *  @param string 参数
 *
 *  @return 符合要求返回YES，否则返回NO
 */
+ (BOOL)validateChinese:(NSString *)string;

/**
 *  国内手机号正则校验
 *
 *  @param phone 参数
 *
 *  @return 符合要求返回YES，否则返回NO
 */
+ (BOOL)validatePhone:(NSString *)phone;


@end
