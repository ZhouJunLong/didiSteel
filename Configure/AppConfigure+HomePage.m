//
//  AppConfigure+HomePage.m
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/1/23.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "AppConfigure+HomePage.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation AppConfigure (HomePage)

+ (NSString *)homeApiFor:(ApiHomeIndex)apiIndex{
    switch (apiIndex) {
        case ApiHomeTopBanner:
            return [NSString stringWithFormat:@"%@/ads/queryAdList.do", ApiBasePath];
            break;
        case ApiHomeGoodsList:
              return [NSString stringWithFormat:@"%@/search/searchMerchantProducts.do", ApiBasePath];
            break;
        default:
            break;
    }
}

@end
#pragma clang diagnostic pop
