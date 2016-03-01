//
//  SettingConfig.h
//  Lalocal
//
//  Created by LinfangTu on 15/12/21.
//  Copyright © 2015年 Copyright (c) 2015 Hangzhou Destination Technology Co., Ltd. All rights reserved.
//

#ifndef SettingConfig_h
#define SettingConfig_h


//系统参数
#define IOS7 [[[UIDevice currentDevice] systemVersion] floatValue] >= 7
#define IOS8 [[[UIDevice currentDevice] systemVersion] floatValue] >= 8
#define IOS9 [[[UIDevice currentDevice] systemVersion] floatValue] >= 9

#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)) : NO)
#define iPhone6plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? (CGSizeEqualToSize(CGSizeMake(1125, 2001), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)) : NO)


//图片适配
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidthRatio  (kScreenWidth / 375.0)
#define kScreenHeightRatio (kScreenHeight / 667.0)
#define AdaptedWidthValue(x)  (ceilf((x) * kScreenHeightRatio))
#define AdaptedHeightValue(x) (ceilf((x) * kScreenWidthRatio))

//定义字体大小
#define DEFAULT_FONT_10    10
#define DEFAULT_FONT_11    11
#define DEFAULT_FONT_12    12
#define DEFAULT_FONT_13    13
#define DEFAULT_FONT_14    14
#define DEFAULT_FONT_15    15
#define DEFAULT_FONT_16    16
#define DEFAULT_FONT_17    17
#define DEFAULT_FONT_18    18

//定义字体类型，外部导入字体苹方，在不同系统中字体名称不同
#define PingFang_Bold(s) (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)?([UIFont fontWithName:@".PingFang-SC-Medium" size:s]):([UIFont fontWithName:@"PingFang_SC_Bold" size:s]))
#define PingFang_Regular(s) (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8)?([UIFont fontWithName:@".PingFang-SC-Regular" size:s]):([UIFont fontWithName:@"PingFang_SC_Medium" size:s]))


//定义颜色
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBCOLOR_ALPHA(r,g,b,a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]

/*风格颜色*/
#define tabbarColor_Normal       RGBCOLOR(179,179,179)
#define tabbarColor_Selected     RGBCOLOR(143,230,255)
#define lineBorderColor          RGBCOLOR(217,217,217)
#define orangeColor              RGBCOLOR(255,170, 42)
#define appBlueColoer            RGBCOLOR(143,230,255)

#define imageViewBackBlueColoer  RGBCOLOR(220,243,250)

#define priceRedColoer           RGBCOLOR(255,111,111)

#define garyColor_26             RGBCOLOR(26 ,26 , 26)
#define garyColor_102            RGBCOLOR(102,102,102)
#define garyColor_140            RGBCOLOR(140,140,140)
#define garyColor_179            RGBCOLOR(179,179,179)
#define garyColor_217            RGBCOLOR(217,217,217)
#define garyColor_238            RGBCOLOR(238,238,238)



#endif /* SettingConfig_h */
