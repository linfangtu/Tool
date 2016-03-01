//
//  LLCommonClass.m
//  Lalocal
//
//  Created by LinfangTu on 16/1/5.
//  Copyright © 2016年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//

#import "LLCommonClass.h"
#import <CommonCrypto/CommonDigest.h>
#import "LLTargetModel.h"

@implementation LLCommonClass


/**
 *  md5加密
 *
 *  @param input 原字符串
 *
 *  @return 加密后的字符串
 */
+ (NSString *)md5HexDigest:(NSString *)input {
    
    const char* str = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5(str, (int)[input lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    
    for (i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [ms appendFormat:@"%02x", (int)(digest[i])];
    }
    
    return [ms copy];
}

//获取相应文件夹大小
+ (NSUInteger)fileSizeAtPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size = [fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size;
    }
    return 0;
}


+ (LLTargetModel *)parsingActivityURL:(NSString *)urlString {
    NSRange range = [urlString rangeOfString:@"lalocal://"];
    if (range.location != NSNotFound) {
        NSString *dataString = [urlString substringFromIndex:(range.length)];
        NSData *jsonData = [dataString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *err;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
        
        if(err) {
            NSLog(@"json解析失败：%@",err);
            return nil;
        }
        LLTargetModel *model = [[LLTargetModel alloc] init];
        model.targetId = data[@"targetId"];
        model.targetType = data[@"targetType"];
        model.errorCode = data[@"errorCode"];
        
        return model;
    }
    return nil;
}

/**
 *  图片压缩 750*560
 *
 *  @param urlStr url字符串
 *
 *  @return url
 */
+ (NSURL *)articleImageMogrWithUrlString:(NSString *)urlStr {
    NSString *urlString = [NSString stringWithFormat:@"%@?imageMogr2/auto-orient/strip/thumbnail/!750x560r/gravity/Center/crop/750x560", urlStr];
    NSURL *url = [[NSURL alloc] initWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    return url;
}


/**
 *  图片压缩 702*629
 *
 *  @param urlStr url字符串
 *
 *  @return url
 */
+ (NSURL *)illustratedImageMogrWithUrlString:(NSString *)urlStr {
    NSString *urlString = [NSString stringWithFormat:@"%@?imageMogr2/auto-orient/strip/thumbnail/!702x629r/gravity/Center/crop/702x629", urlStr];
    NSURL *url = [[NSURL alloc] initWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    return url;

}


/**
 *  图片压缩 702*390
 *
 *  @param urlStr url字符串
 *
 *  @return url
 */
+ (NSURL *)productImageMogrWithUrlString:(NSString *)urlStr {
    NSString *urlString = [NSString stringWithFormat:@"%@?imageMogr2/auto-orient/strip/thumbnail/!702x390r/gravity/Center/crop/702x390", urlStr];
    NSURL *url = [[NSURL alloc] initWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    return url;

}

@end
