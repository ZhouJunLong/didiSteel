//
//  CommonHeader.h
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/1/22.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#ifndef CommonHeader_h
#define CommonHeader_h

// DataCenter
#import "DataCenterDelegate.h"
#import "DataSilentLoader.h"
#import "DataResult.h"

// Category
#import "UIColor+ODY.h"
#import "NSObject+ODY.h"
#import "NSString+ODY.h"
#import "NSMutableDictionary+ODY.h"

// Configure
#import "AppConfigure.h"
#import "AppConfigure+Login.h"
#import "AppConfigure+Utils.h"
#import "AppConfigure+HomePage.h"
#import "AppConfigure+Search.h"
#import "AppConfigure+Setting.h"

// Api
#import "ApiMine.h"

#import "ComDefine.h"
#import "UtilsDefine.h"
#import "ODYRouter.h"
#import "ODYTools.h"
#import "HJValueObject.h"
#import "HJLibNotiDefine.h"
#import "HJUserDefaultDefine.h"
#import "NSMutableString+AppendString.h"

// object
#import "NSObject+PerformBlock.h"
#import "NSObject+BeeNotification.h"
#import "NSObject+AssociatedObject.h"
#import "HJValueObject.h"

// net
#import "HJOperationManager.h"
#import "HJOperationManager+Upload.h"
#import "HJLogic.h"
#import "HJReachability.h"

#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"

// tools
#import "HJSwizzle.h"
#import "ShoppingCartTools.h"
#import "JoinCartAnimationTool.h"

// define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND
// define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS
#import <Masonry/Masonry.h>

#import "ODYRouter.h"
#import "HJKeychain.h"
#import "ODYUserDefault.h"
#import "ODYArchiveData.h"
#import "ODYFileManager.h"

#import "UIImage+tool.h"
#import "HJBorder.h"
#import "HJCorner.h"
#import "HJJsonKit.h"
#import "UIView+EnlargeArea.h"
#import <BlocksKit/BlocksKit.h>
#import <BlocksKit/BlocksKit+UIKit.h>
#import "NSArray+MASHelper.h"
#import "HJWeakObjectDeathNotifier.h"
#import "NSString+ConvertType.h"
#import "HJLog.h"
#import "HJSize.h"

// view
//#import "UIView+loading.h"
#import "UIView+create.h"
#import "PhoneTabBarItem.h"
#import "BaseTableView.h"
#import "BaseCollectionView.h"
#import "BaseTVCell.h"
#import "BasePickerView.h"

// vc
#import "PhoneVC.h"
#import "BaseNC.h"
#import "PhoneTBC.h"
#import "TableVC.h"
#import "PhoneWebVC.h"

// base vcs views
#import "UINib+create.h"
#import "UIView+create.h"
#import "BaseViewController.h"
#import "BaseNC.h"
#import "BaseTBC.h"
#import "BaseView.h"
#import "BaseAlertView.h"
#import "UITableView+loadingMore.h"
#import "UIButton+Expand.h"
#import "UIImageView+LoadingIndicator.h"
#import "UIView+Extension.h"
#import "UIViewController+Custom.h"
//#import "UIViewController+loading.h"
#import "UILabel+TextStyle.h"

// log
#import "HJLog.h"

// safe
#import "NSObject+safe.h"
#import "ODYGlobalValue.h"
#import "ODYGlobalValue+User.h"
#import "ODYGlobalValue+Location.h"
#import "ODYGlobalValue+AppClient.h"
#import "HJOperationManager.h"

#import "NSObject+safe.h"
// Category
#import "NSError+HJFramework.h"
#import "UIDevice+IdentifierAddition.h"
#import "JSONValueTransformer+router.h"
#import "UIViewController+hj.h"
//#import "UIViewController+loading.h"
#import "NSDictionary+router.h"
#import "NSArray+router.h"
#import "NSMutableArray+router.h"
#import "NSMutableArray+Form.h"
#import "NSDictionary+safe.h"
#import "NSObject+AssociatedObject.h"
#import "NSObject+BeeNotification.h"
#import "NSObject+JsonToVO.h"
#import "NSObject+PerformBlock.h"
#import "NSObject+safe.h"
#import "NSString+MD5.h"
#import "NSData+Hex.h"
#import "NSObject+Tips.h"
// CommonView
#import "SysUtil.h"  // 公共弹框类
#import "ViewUtil.h" // 视图工具类
#import "ViewUtil+Customize.h"
#import "ShareView.h"
#import "CountDownView.h"
#import "ContentShareUtil.h"

// app delegate
#import "PhoneAppDelegate.h"

//#import "MBProgressHUD+JExpand.h"
#import "MJRefresh.h"
#import "FMDatabase.h"
#import "ErrorView.h"
#import "BusinessLogic.h"
#import "SDCycleScrollView.h"

#import "OdyLoadingView.h"
#import "OdyRefresh.h"

// notification
#import "HJCommonNotiDefine.h"

// growingIO
#import "Growing.h"

//微信相关
#import "PayManager.h"
#import "WXApi.h"

//
#import "UIScrollView+XMFRefresh.h"
#import "TestVCLayout.h"
#import "TestCellLayout.h"

// FormTVCell单元格相关。
#import "CycleImageCell.h"       // 左右贴边 的 轮播图。
#import "FormBasicTVCell.h"      // 单元格基类。
#import "FormOnlyTitleTVCell.h"  // 仅有 左侧 左对齐 文字。
#import "FormTitleValueTVCell.h" // 左侧 左对齐 只读文字 + 右侧 右对齐 只读文字。

#import "FormAlternativeTVCell.h"          // 靠左侧 二选一 单元格。
#import "SimpleRightSelectTVCell.h"        // 左侧 左对齐 只读标题 + 右边缘 选择图标(选中或者没有选中图标)
#import "FormTitleValueArrowTVCell.h"      // 左侧 左对齐 只读标题 ＋ 右侧 右对齐 只读文字 ＋ 右边缘箭头。
#import "FormSimpleItemAndContentTVCell.h" // 左侧 左对齐 冒号分隔的一段文字。
#import "FormTitleAndContentTVCell.h"        // 左侧 左对齐 冒号分隔的一段文字(颜色改变)。

#import "FormOneImageSelectTVCell.h" // 单张图片选择 靠左线性排列：图片 + 说明文字。

// 商品相关 通用单元格。
#import "FormOrderStatusTVCell.h"   // 左右贴边 的 商品状态 单元格。
#import "FormConfirmSteelTVCell.h"  // 商品确认页面 钢铁类商品信息单元格。
#import "FormSelectAddressTVCell.h" // 带 名字 ＋ 电话 ＋ 地址 显示的地址选择器。
#import "FormTotalAmountTVCell.h"   // 仅 金额合计单元格，形如：合计：¥123456.00
#import "OrderStatusLittleTVCell.h" // 显示信息 -- 订单号：xxxx 订单状态：xxx

#import "FormTitleArrowTVCell.h"  // 左标题 + 右显示数值 + 右箭头单元格
#import "FormTitleInputTVCell.h"  // 左标题 + 右输入框
#import "FormTitleSwitchTVCell.h" // 左标题 + 右switch开关
#import "FormTitleImageTVCell.h"  // 左标题 + 右图片
#import "ModifySexTVCell.h"       // 左标题 + 性别选择

// 订单业务相关。
#import "SucceedInOrderingVC.h"

#endif /* CommonHeader_h */
