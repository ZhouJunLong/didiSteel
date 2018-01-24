//
//  AppConfigure+Utils.m
//  DiDiSteel
//
//  Created by sean on 2016/6/21.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "TabSliderView.h"
#import "AppConfigure+Utils.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation AppConfigure (Utils)

+ (NSString *)mainLoadingImage
{
    return @"zhuge.gif";
}

+ (CGFloat)cornerSize
{
    return 6;
}

+ (void)gotoShoppingCart
{
    // [ODYRouter gotoPage:@"shoppingCart"]; //跳转到我的购物车页面
    [[ODYGlobalValue sharedInstance].globalTbc enterTabWithIndex:2 popToRoot:YES];
}

+ (NSMutableDictionary *)myOrderTab
{
    NSDictionary *tab = @{
        CKTabKeys : @[ @(0), @(1), @(2), @(3), @(10) ],
        CKTabItems : @[ @"全部", @"待付款", @"待发货", @"已发货", @"已取消" ],
        CKTabBGColor : [UIColor whiteColor],
        CKTabTextColor : FontColorBlack,
        CKTabShowHighlightLine : @(YES),
        CKTabTextHighlightColor : ThemeColor,
        CKTabLineHighlightColor : ThemeColor
    };

    return [tab getMutableDictionary];
}

+ (NSMutableDictionary *)myMessageTab
{
    NSDictionary *tab = @{
        CKTabKeys : @[ @(0), @(1) ],
        CKTabItems : @[ @"系统公告", @"交易提醒" ],
        CKTabBGColor : [UIColor whiteColor],
        CKTabTextColor : FontColorBlack,
        CKTabShowHighlightLine : @(NO),
        CKTabTextHighlightColor : ThemeColor,
        CKTabDividingLine : @(YES),
        CKTabDividingColor : DividerColor
    };

    return [tab getMutableDictionary];
}

+ (NSMutableArray *)loadingImages
{
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 1; i < 10; i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"加载动画小－%d", i]];
        [imageArray addObject:image];
    }

    return imageArray;
}

+ (NSMutableArray *)pullLoadingImages
{
    NSMutableArray *imageArray = [NSMutableArray arrayWithCapacity:0];
    for (int i = 1; i < 16; i++)
    {
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"loading%d", i]];
        [imageArray addObject:image];
    }

    return imageArray;
}

+ (NSString *)appApiDomain
{
    AppApiDomainType apiDomainType = [ODYGlobalValue apiDomainType];

#ifndef DEBUG
    apiDomainType = AppApiDomainSTG;
#endif
    switch (apiDomainType)
    {
        case AppApiDomainLocalTrunk: // 内网主干环境
//            return @"http://192.168.1.230";
            return @"http://stg.steel.oudianyun.com";

        case AppApiDomainSTG: // 外网域名
//            return @"http://stg.steel.oudianyun.com";
            return @"http://www.didisteel.com";
        case AppApiDomainLocalDev: // 内网域名无法使用 frontdd.odianyun.local
        default:                   // 默认内网开发环境。
//            return @"http://192.168.1.176";
//            return @"http://stg.steel.oudianyun.com";
            return @"http://www.didisteel.com";
    }
}

+ (NSMutableArray *)networkEnvironmentItems
{
    NSArray *items = @[
        @{ CKLabel : @"内网开发环境",
           CKValue : @(AppApiDomainLocalDev),
           CKAction : @(CellActionSelect),
           CKCellClass : [FormTitleArrowTVCell class] },
        @{ CKLabel : @"外网STG环境",
           CKValue : @(AppApiDomainSTG),
           CKAction : @(CellActionSelect),
           CKCellClass : [FormTitleArrowTVCell class] }
    ];

    return items.getMutableArray;
}

+ (NSString *)utilsApiFor:(ApiUtilsIndex)apiIndex
{
    switch (apiIndex)
    {
        case ApiUploadFile:
            return [NSString stringWithFormat:@"%@/upload/uploadFile.do", ApiBasePath];

        default:
            return @"";
    }
}

@end

#pragma clang diagnostic pop
