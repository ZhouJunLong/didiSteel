//
//  ApiShoppingCart.m
//  DiDiSteel
//
//  Created by demo.zheng on 2016/6/17.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "ApiShoppingCart.h"

@implementation ApiShoppingCart

/**
 * 获取购物车列表接口
 * @param
 */
+ (DataSilentLoader *)getCartItemListCallback:(DataSilentLoaderCallBack)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/cart/getCartItemList.do", ApiBasePath];
    return [DataSilentLoader postURL:url params:nil callback:callback];
}

/**
 * 添加购物车接口
 * @param
 */
+ (DataSilentLoader *)addCartItem:(NSString *)mpId callback:(DataSilentLoaderCallBack)callback
{
    if ([ODYTools iSNull:mpId])
    {
        return nil;
    }

    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    [param setObject:mpId forKey:@"mpId"];
    [param setValue:@"1" forKey:@"num"];
    NSString *url = [NSString stringWithFormat:@"%@/cart/addCartItem.do", ApiBasePath];
    return [DataSilentLoader postURL:url params:param callback:callback];
}

/**
 * 清空购物车接口
 * @param
 */
+ (DataSilentLoader *)clearCartItemCallback:(DataSilentLoaderCallBack)callback
{
    NSString *url = [NSString stringWithFormat:@"%@/cart/clearCartItem.do", ApiBasePath];
    return [DataSilentLoader postURL:url params:nil callback:callback];
}

/**
 * 根据id删除购物车接口
 * @param
 */
+ (DataSilentLoader *)delCartItemMpIds:(NSString *)mpIds callback:(DataSilentLoaderCallBack)callback
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    if (![ODYTools iSNull:mpIds])
    {
        [param setObject:mpIds forKey:@"mpIds"];
    }

    NSString *url = [NSString stringWithFormat:@"%@/cart/delCartItem.do", ApiBasePath];
    return [DataSilentLoader postURL:url params:param callback:callback];
}

/**
 *  根据id进行购物车结算
 *
 *  @param mpIds    拼接的购物车商品id
 */
+ (DataSilentLoader *)cartSettleCartItemMpIds:(NSString *)mpIds callback:(DataSilentLoaderCallBack)callback
{
    if ([ODYTools iSNull:mpIds])
    {
        return nil;
    }

    NSDictionary *param = @{ @"mpIds" : mpIds };
    NSString *url = [NSString stringWithFormat:@"%@/cart/cartSettle.do", ApiBasePath];
    return [DataSilentLoader postURL:url params:param callback:callback];
}

@end
