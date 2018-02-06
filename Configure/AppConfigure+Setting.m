//
//  AppConfigure+Setting.m
//  DiDiSteel
//
//  Created by sean on 2016/6/21.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "ModifySexTVCell.h"
#import "FormOneButtonTVCell.h"
#import "FormTitleArrowTVCell.h"
#import "FormTitleInputTVCell.h"
#import "FormTitleImageTVCell.h"
#import "FormTitleValueTVCell.h"
#import "AppConfigure+Setting.h"
#import "FormSimpleInputTVCell.h"
#import "FormTitleSwitchTVCell.h"
#import "FormIconTitleArrowTVCell.h"
#import "FormHeadImageSelectTVCell.h"
#import "FormMultiLevelDistrictTVCell.h"
#import "FormOneButtonTVCell.h"
#import "FormThreeTitleTVCell.h"
#import "FormTitleArrowTVCell.h"
#import "FormSimpleInputTVCell.h"

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wobjc-protocol-method-implementation"

@implementation AppConfigure (Setting)

+ (NSNumber *)companyId
{
    return @(7);
}
+ (UIImage *)userHeadIcon
{
    return [UIImage imageNamed:@"my_head_portrait"];
}
+ (NSString *)servicePhoneNumber
{
    return @"4000-123-456";
}
+ (NSMutableArray *)mineItems
{
    NSArray *items = @[
                       @[
                           @{ CKLabel : @"我的拼团",
                              CKImage : @"my_fight_groups",
                              CKAction : @(CellActionPleaseWait),
                              CKBottomLine : @(YES),
                              CKCornerType : @(UIRectCornerTop) },
                           @{ CKLabel : @"我的订单",
                              CKImage : @"my_order",
                              CKAction : @(CellActionGotoPage),
                              CKValue : @"receiverOrder",
                              CKBottomLine : @(YES) },
                           @{ CKLabel : @"我的发票",
                              CKImage : @"my_invoice",
                              CKAction : @(CellActionGotoPage),
                              CKValue : @"myInvoices",
                              CKBottomLine : @(YES) },
                           @{ CKLabel : @"收货地址",
                              CKImage : @"my_address",
                              CKAction : @(CellActionGotoPage),
                              CKValue : @"receiverAddress",
                              CKCornerType : @(UIRectCornerBottom) }
                           ],
                       @[
                           @{ CKLabel : @"我的红包",
                              CKImage : @"my_red",
                              CKAction : @(CellActionPleaseWait),
                              CKBottomLine : @(YES),
                              CKCornerType : @(UIRectCornerTop) },
                           @{ CKLabel : @"我的消息",
                              CKImage : @"my_news",
                              CKAction : @(CellActionGotoPage),
                              CKValue : @"MyMessage",
                              CKCornerType : @(UIRectCornerBottom) }
                           ],
                       @[
                           @{
                               CKLabel : [NSString stringWithFormat:@"联系客服（%@)", [self servicePhoneNumber]],
                               CKImage : @"my_customer_service",
                               CKValue : [AppConfigure servicePhoneNumber],
                               CKAction : @(CellActionCallPhone),
                               CKBottomLine : @(YES),
                               CKCornerType : @(UIRectCornerTop)
                               },
#ifdef DEBUG
                           @{ CKLabel : @"切换环境",
                              CKImage : @"my_we",
                              CKValue : @"networkEnvironment",
                              CKAction : @(CellActionGotoPage),
                              CKBottomLine : @(YES) },
#endif
                           @{ CKLabel : @"意见反馈",
                              CKImage : @"my_feedback",
                              CKAction : @(CellActionGotoPage),
                              CKValue : @"commentFeedBack",
                              CKCornerType : @(UIRectCornerBottom) }
                           ],
                       @[
                           @{ CKLabel : @"官方微信",
                              CKImage : @"my_official",
                              CKValue : @"officialWeChat",
                              CKAction : @(CellActionGotoPage),
                              CKBottomLine : @(YES),
                              CKCornerType : @(UIRectCornerTop) },
                           @{ CKLabel : @"关于我们",
                              CKImage : @"my_we",
                              CKValue : @"aboutUs",
                              CKAction : @(CellActionGotoPage),
                              CKCornerType : @(UIRectCornerBottom),
                              CKFooterHeight : @(10) }
                           ]
                       ];
    
    return [items getMutableArray];
}

+ (NSMutableArray *)settingItems
{
    NSMutableArray *items = @[
                              @[
                                  @{ CKLabel : @"修改密码",
                                     CKAction : @(CellActionGotoPage),
                                     CKValue : @"changeThePassword",
                                     CKCellClass : [FormTitleArrowTVCell class],
                                     CKCornerType : @(UIRectCornerAllCorners) }
                                  ],
                              @[
                                  @{ CKLabel : @"重置密码",
                                     CKAction : @(CellActionGotoPage),
                                     CKValue : @"captchasForResetPassword",
                                     CKCellClass : [FormTitleArrowTVCell class],
                                     CKCornerType : @(UIRectCornerAllCorners) }
                                  ],
                              @[
                                  @{ CKLabel : @"当前版本",
                                     CKValue : @"v1.0",
                                     CKCellClass : [FormTitleValueTVCell class],
                                     CKAction : @(CellActionNone),
                                     CKCornerType : @(UIRectCornerAllCorners) }
                                  ]
                              ].mutableCopy;
    
    if ([ODYGlobalValue isLogin])
    {
        [items append:@[
                        @[
                            @{
                                CKLabel : @"退出登录",
                                CKTitleColor : [UIColor redColor],
                                CKHeaderHeight : @(30),
                                CKCellClass : [FormOneButtonTVCell class],
                                CKAction : @(CellActionLogout),
                                CKCornerType : @(UIRectCornerAllCorners), @"nothings" : @"nothings"
                                }
                            ]
                        ]];
    }
    
    return [items getMutableArray];
}
+ (NSMutableArray *)userInfoItems
{
    NSArray *items = @[
                       @{ CKLabel : @"头像",
                          CKValue : [AppConfigure userHeadIcon],
                          CKFormKey : @"headPicUrl",
                          CKCellClass : [FormHeadImageSelectTVCell class],
                          CKCornerType : @(UIRectCornerAllCorners) },
                       
                       @{ CKLabel : @"用户名",
                          CKFormKey : @"mobile",
                          CKValue : @"注：不可编辑",
                          CKCellClass : [FormThreeTitleTVCell class],
                          CKCornerType : @(UIRectCornerAllCorners) },
                       
                       @{
                           CKLabel : @"真实姓名",
                           CKPlaceholder : @"请输入",
                           CKLeft : @(100),
                           CKFormKey : @"nikName",
                           CKCheckEmpty : @(YES),
                           CKCellClass : [FormTitleInputTVCell class],
                           CKValueAlign : @(NSTextAlignmentLeft),
                           CKCornerType : @(UIRectCornerAllCorners)
                           },
                       
                       @{ CKLabel : @"性别",
                          CKFormKey : @"sex",
                          CKLeft : @(100),
                          CKCellClass : [ModifySexTVCell class],
                          CKCornerType : @(UIRectCornerAllCorners) },
                       
                       @{
                           CKLabel : @"QQ",
                           CKPlaceholder : @"请输入",
                           CKLeft : @(100),
                           CKFormKey : @"qq",
                           CKCheckNumber : @(YES),
                           CKKeyboardType : @(UIKeyboardTypeNumberPad),
                           CKCellClass : [FormTitleInputTVCell class],
                           CKValueAlign : @(NSTextAlignmentLeft),
                           CKCornerType : @(UIRectCornerAllCorners)
                           },
                       
                       @{ CKLabel : @"保存",
                          CKTitleColor : [UIColor whiteColor],
                          CKCellBGColor : ThemeColor,
                          CKHeaderHeight : @(30),
                          CKCellClass : [FormOneButtonTVCell class],
                          CKCornerType : @(UIRectCornerAllCorners) }
                       ];
    
    return [items getMutableArray];
}
+ (NSString *)settingApiFor:(ApiSettingIndex)apiIndex
{
    switch (apiIndex)
    {
        case ApiGetUserInfo:
            return [NSString stringWithFormat:@"%@/user/getUserInfo.do", ApiBasePath];
            
        case ApiUpdateUserInfo:
            return [NSString stringWithFormat:@"%@/user/updateUserInfo.do", ApiBasePath];
            
        default:
            return @"";
    }
}

@end

#pragma clang diagnostic pop
