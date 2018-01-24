//
//  HJCommonDefine.h
//  IHomeCommon
//
//  Created by bibibi on 15/7/23.
//  Copyright (c) 2015年 ihome. All rights reserved.
//

#ifndef IHomeCommon_HJCommonDefine_h
#define IHomeCommon_HJCommonDefine_h

//业务define

//省份切换
#define HJ_PROVINCE_CHANGED                 @"HJ_PROVINCE_CHANGED"//省份切换成功


UIKIT_EXTERN NSString *const UserDefaultAutoLogin;
UIKIT_EXTERN NSString *const UserDefaultUnionLogin;
UIKIT_EXTERN NSString *const KeychainAccount;

/**
 *  注销
 */
UIKIT_EXTERN NSString *const NotificationLogout;
/**
 *  登录成功
 */
UIKIT_EXTERN NSString *const NotificationLogin;
/**
 *  登录失败
 */
UIKIT_EXTERN NSString *const NotificationLoginFailed;
/**
 *  取消登录（登录页面点击返回按钮会触发）
 */
UIKIT_EXTERN NSString *const NotificationLoginCanceled;

#endif
