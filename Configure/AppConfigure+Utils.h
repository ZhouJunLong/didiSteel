//
//  AppConfigure+Utils.h
//  DiDiSteel
//
//  Created by sean on 2016/6/21.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "AppConfigure.h"

@interface AppConfigure (Utils)

+ (CGFloat)cornerSize;    // 圆角大小，浮点数格式。
+ (void)gotoShoppingCart; // 转到购物车。

+ (NSMutableDictionary *)myOrderTab;
+ (NSMutableDictionary *)myMessageTab;

+ (NSMutableArray *)networkEnvironmentItems;

@end
