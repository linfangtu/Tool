//
//  LoadWebViewImage.h
//  ObjCLoadWebviewImage
//
//  Created by LinfangTu on 15/12/18.
//  Copyright © 2015年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//


//缓存webView上的图片
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LoadWebViewImage : NSObject {
    NSString *htmlString;
    NSMutableArray *imageViews;
}

+ (LoadWebViewImage *)sharedManager;

- (void)loadImageWithHtmlContent:(NSString *)htmlContont webView:(UIWebView *)webView baseUrl:(NSURL *)url;


@end
