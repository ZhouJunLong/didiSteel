//
//  ViewUtil+Customize.h
//  DiDiSteel
//
//  Created by sean on 2016/6/17.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "ViewUtil.h"

@interface ViewUtil (Customize)

#pragma mark----  Related To LoginAndRegister
/**
 *  登录按钮
 */
+ (UIButton *)createLoginButton:(NSString *)title target:(id)target action:(SEL)action;

/**
 *  注册页面的注册按钮。
 */
+ (UIButton *)createRegisterPageRegisterButton:(NSString *)title target:(id)target action:(SEL)action;

/**
 *  主题色按钮
 */
+ (UIButton *)createThemeButton:(NSString *)title target:(id)target action:(SEL)action;

@end
