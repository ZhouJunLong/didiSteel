//
//  AppConfigure+Search.m
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/1/25.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "AppConfigure+Search.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation AppConfigure (Search)

+ (NSString *)searchApiFor:(ApiSearchIndex)apiSearch
{
    
    switch (apiSearch)
    {
        case ApiSearchIndexCategoryTree:
            return [NSString stringWithFormat:@"%@/category/getCategoryTrees.do", ApiBasePath];
            break;
            
        case ApiSearchIndexDynamicSearch:
            return [NSString stringWithFormat:@"%@/search/searchSuggest", ApiBasePath];
            break;
            
        case ApiSearchIndexGoodsList:
            return [NSString stringWithFormat:@"%@/search/searchMerchantProducts", ApiBasePath];
            break;
            
        default:
            return @"";
            break;
    }
}



@end
#pragma clang diagnostic pop
