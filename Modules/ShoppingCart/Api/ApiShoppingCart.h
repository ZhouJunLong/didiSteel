//
//  ApiShoppingCart.h
//  DiDiSteel
//
//  Created by demo.zheng on 2016/6/17.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiShoppingCart : NSObject

/**
 * 获取购物车列表接口
 * @param
 */
+ (DataSilentLoader *)getCartItemListCallback:(DataSilentLoaderCallBack)callback;

/**
 * 添加购物车接口
 * @param
 */
+ (DataSilentLoader *)addCartItem:(NSString *)mpId callback:(DataSilentLoaderCallBack)callback;

/**
 * 清空购物车接口
 * @param
 */
+ (DataSilentLoader *)clearCartItemCallback:(DataSilentLoaderCallBack)callback;

/**
 * 根据id删除购物车接口
 * @param
 */
+ (DataSilentLoader *)delCartItemMpIds:(NSString *)mpIds callback:(DataSilentLoaderCallBack)callback;

/**
 *  根据id进行购物车结算
 *
 *  @param mpIds    拼接的购物车商品id
 */
+ (DataSilentLoader *)cartSettleCartItemMpIds:(NSString *)mpIds callback:(DataSilentLoaderCallBack)callback;

@end
