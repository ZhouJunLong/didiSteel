//
//  ViewUtil+Customize.m
//  DiDiSteel
//
//  Created by sean on 2016/6/17.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "ViewUtil+Customize.h"

@implementation ViewUtil (Customize)

#pragma mark -  related to login
/**
 *  登录按钮
 */
+ (UIButton *)createLoginButton:(NSString *)title target:(id)target action:(SEL)action
{
    return [self createThemeButton:title target:target action:action];
}

/**
 *  注册页面的注册按钮。
 */
+ (UIButton *)createRegisterPageRegisterButton:(NSString *)title target:(id)target action:(SEL)action
{
    return [self createThemeButton:title target:target action:action];
}

/**
 *  主题色按钮
 */
+ (UIButton *)createThemeButton:(NSString *)title target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    button.backgroundColor = ThemeColor;
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    button.layer.cornerRadius = 4.0;
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor fromInteger:0xFFFFFF] forState:UIControlStateNormal];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];

    return button;
}

@end
