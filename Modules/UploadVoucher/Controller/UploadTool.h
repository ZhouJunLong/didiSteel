//
//  UploadTool.h
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/21.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UploadTool : NSObject
/**
 * 上传订单凭证
 * @param imageData 图片大小
 * @param orderCode 订单编号
 * @param orderAmount 订单金额
 * @param companyId 商品id
 */
+ (void)saveOrder:(NSData *)imageData companyId:(NSString *)companyId orderCode:(NSString *)orderCode orderAmount:(NSString *)orderAmount viewController:(UIViewController *)viewController;

@end
