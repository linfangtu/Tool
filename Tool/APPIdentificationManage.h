//
//  APPIdentificationManage.h
//  Lalocal
//
//  Created by LinfangTu on 16/1/7.
//  Copyright © 2016年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//


//获取UUID，保存在钥匙串中
#import <Foundation/Foundation.h>

@interface APPIdentificationManage : NSObject

+ (APPIdentificationManage *)sharedAPPIdentificationManage;

- (id)readUUID;

@end
