//
//  APPIdentificationManage.m
//  Lalocal
//
//  Created by LinfangTu on 16/1/7.
//  Copyright © 2016年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//

#import "APPIdentificationManage.h"
#import <Security/Security.h>
#import "APPIdentificationManage.h"


#define KEY_UUID            @"KEY_UUID"
#define KEY_IN_KEYCHAIN     @"KEY_IN_KEYCHAIN"


@implementation APPIdentificationManage

+ (APPIdentificationManage *)sharedAPPIdentificationManage {
    static APPIdentificationManage *sharedAPPIdentificationManage = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAPPIdentificationManage = [[self alloc] init];
    });
    return sharedAPPIdentificationManage;

}

#pragma mark 获取UUID
/**
 *UUID, 全球独立标识(Globally Unique Identifier)，据wiki说UUID随机数算法得到的数重复概率为170亿分之一
 *此UUID是唯一的，但应用删除再重新安装后会变化，采取的措施是：只获取一次保存在钥匙串中，之后就从钥匙串中获取
 **/
- (NSString *)openUUID {
    
    NSString *currentDeviceId = [[NSUUID UUID] UUIDString];
    return currentDeviceId;

}

#pragma mark 保存UUID到钥匙串

- (void)saveUUID:(NSString *)uuid {
    
    NSMutableDictionary *udidKVPairs = [NSMutableDictionary dictionary];
    
    [udidKVPairs setObject:uuid forKey:KEY_UUID];
    
    [[APPIdentificationManage sharedAPPIdentificationManage] save:KEY_IN_KEYCHAIN data:udidKVPairs];
    
}

#pragma mark 读取UUID

/**
 *先从内存中获取uuid，如果没有再从钥匙串中获取，如果还没有就生成一个新的uuid，并保存到钥匙串中供以后使用
 **/
- (id)readUUID {
    
    NSMutableDictionary *udidKVPairs = (NSMutableDictionary *)[[APPIdentificationManage sharedAPPIdentificationManage] load:KEY_IN_KEYCHAIN];
    
    NSString *uuid = [udidKVPairs objectForKey:KEY_UUID];
    
    if (uuid == nil || uuid.length == 0) {
        
        uuid = [self openUUID];
        
        [self saveUUID:uuid];
        
    }
    
    return uuid;
    
}

#pragma mark 删除UUID

- (void)deleteUUID {
    
    [self delete:KEY_IN_KEYCHAIN];
    
}

#pragma mark 查询钥匙串
- (NSMutableDictionary *)getKeychainQuery:(NSString *)service {
    
    return [NSMutableDictionary dictionaryWithObjectsAndKeys: (__bridge_transfer id)kSecClassGenericPassword,(__bridge_transfer id)kSecClass,  service, (__bridge_transfer id)kSecAttrService, service,(__bridge_transfer id)kSecAttrAccount,  (__bridge_transfer id)kSecAttrAccessibleAfterFirstUnlock,(__bridge_transfer id)kSecAttrAccessible,  nil, nil];
    
}

#pragma mark 将数据保存到钥匙串
- (void)save:(NSString *)service data:(id)data {
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    [keychainQuery setObject:[NSKeyedArchiver archivedDataWithRootObject:data] forKey:(__bridge_transfer id)kSecValueData];
    SecItemAdd((__bridge_retained CFDictionaryRef)keychainQuery, NULL);
    
}

#pragma mark 加载钥匙串中数据
- (id)load:(NSString *)service {
    
    id ret = nil;
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];
    [keychainQuery setObject:(id)kCFBooleanTrue forKey:(__bridge_transfer id)kSecReturnData];
    [keychainQuery setObject:(__bridge_transfer id)kSecMatchLimitOne forKey:(__bridge_transfer id)kSecMatchLimit];
    CFDataRef keyData = NULL;
    
    if (SecItemCopyMatching((__bridge_retained CFDictionaryRef)keychainQuery, (CFTypeRef *)&keyData) == noErr) {
        
        @try {
            ret = [NSKeyedUnarchiver unarchiveObjectWithData:(__bridge_transfer NSData *)keyData];
        } @catch (NSException *e) {
            
            NSLog(@"Unarchive of %@ failed: %@", service, e);
            
        } @finally {
            
        }
    }
    
    return ret;
    
}

#pragma mark 删除钥匙串中数据
- (void)delete:(NSString *)service {
    
    NSMutableDictionary *keychainQuery = [self getKeychainQuery:service];  
    SecItemDelete((__bridge_retained CFDictionaryRef)keychainQuery);
    
}

@end
