//
//  ApiUploadVoucher.m
//  DiDiSteel
//
//  Created by demo.zheng on 2016/6/20.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "ApiUploadVoucher.h"

@implementation ApiUploadVoucher

/**
 * 上传订单凭证
 * @param ut 用户登录令牌
 * @param orderCode 订单编号
 * @param orderAmount  订单金额
 * @param photoPath 订单凭证路径
 */
+ (DataSilentLoader *)saveOrder:(NSString *)orderCode orderAmount:(double)orderAmount photoPath:(NSString *)photoPath callback:(DataSilentLoaderCallBack)callback
{
    NSMutableDictionary *params = @{ @"orderCode" : orderCode, @"orderAmount" : @(orderAmount), @"photoPath" : photoPath }.mutableCopy;

    NSString *url = [NSString stringWithFormat:@"%@/order/saveOrder.do", ApiBasePath];
    return [DataSilentLoader postURL:url params:params callback:callback];
}

@end
