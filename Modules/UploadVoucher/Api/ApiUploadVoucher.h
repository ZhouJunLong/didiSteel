//
//  ApiUploadVoucher.h
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/20.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ApiUploadVoucher : NSObject

/**
 * 上传订单凭证
 * @param ut            用户登录令牌
 * @param orderCode     订单编号
 * @param orderAmount   订单金额
 * @param photoPath     订单凭证路径
 */
+ (DataSilentLoader *)saveOrder:(NSString *)orderCode orderAmount:(double)orderAmount photoPath:(NSString *)photoPath callback:(DataSilentLoaderCallBack)callback;

@end
