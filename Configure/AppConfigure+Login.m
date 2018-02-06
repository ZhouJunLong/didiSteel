//
//  AppConfigure+Login.m
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/2/5.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "AppConfigure+Login.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation AppConfigure (Login)

+ (int)pwdMinLength
{
    return 6;
}

+ (int)pwdMaxLength
{
    return 16;
}
+ (NSString *)loginPage
{
    return @"phoneLogin";
}

+ (NSString *)loginPageTitle
{
    return @"嘀嘀拼钢";
}

/**
 *  是否记录登录失败的次数(默认是YES)
 */
+ (BOOL)recordLoginFailure
{
    return NO;
}
+ (NSString *)loginApiFor:(ApiIndex)apiIndex
{
    switch (apiIndex)
    {
        case ApiIndexLogin:
            return [NSString stringWithFormat:@"%@/user/login.do", ApiBasePath];
            
        case ApiIndexRegister:
            return [NSString stringWithFormat:@"%@/user/register.do", ApiBasePath];
            
        case ApiIndexResetPassword:
            return [NSString stringWithFormat:@"%@/mobileRegister/modifyPasswordForm.do", UserApi];
            
        case ApiIndexModifyPassword:
            return [NSString stringWithFormat:@"%@/mobileRegister/modifyPasswordOnlineForm.do", UserApi];
            
        case ApiIndexExit:
            return [NSString stringWithFormat:@"%@/mobileLogin/exit.do", UserApi];
            
        case ApiIndexGetCaptchas:
            return [NSString stringWithFormat:@"%@/mobileRegister/sendCaptchasForm.do", UserApi];
            
        case ApiIndexCheckCaptchas:
            return [NSString stringWithFormat:@"%@/mobileRegister/checkCaptchasForm.do", UserApi];
            
        case ApiIndexIsRegistered:
            return [NSString stringWithFormat:@"%@/mobileRegister/isRepeatPhoneForm.do", UserApi];
            
        default:
            return @"";
    }
}

@end
#pragma clang diagnostic pop
