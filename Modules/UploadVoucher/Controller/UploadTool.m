//
//  UploadTool.m
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/21.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "UploadTool.h"

#import "ApiCommon.h"
#import "ApiUploadVoucher.h"

@implementation UploadTool
/**
 * 上传订单凭证
 * @param imageData 图片大小
 * @param orderCode 订单编号
 * @param orderAmount 订单金额
 * @param companyId 商品id
 */
+ (void)saveOrder:(NSData *)imageData companyId:(NSString *)companyId orderCode:(NSString *)orderCode orderAmount:(NSString *)orderAmount viewController:(UIViewController *)viewController
{
    [viewController.view showLoading];
    [ApiCommon uploadFile:imageData
                companyId:companyId
                 callback:^(DataSilentLoader *silentLoader, DataResult *result) {
                     [viewController.view hideLoading];
                     [self showSuccess:result.message];
                     NSString *imageUrl = [[[result.items getMutableArray] objectAtIndex:0] getString:@"imgUrl"];
                     if (!result.hasError)
                     {
                         [ApiUploadVoucher saveOrder:orderCode
                                         orderAmount:1.0
                                           photoPath:imageUrl
                                            callback:^(DataSilentLoader *silentLoader, DataResult *result) {
                                                [self showSuccess:result.message];
                                                if (!result.hasError)
                                                {
                                                    //                                                        [ODYTools showMyMessage:@"上传交易凭证成功！等待管理员审核..."];
                                        }
                                            }];
                     }
                 }];

}
@end
