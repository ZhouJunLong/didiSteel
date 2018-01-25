//
//  Configuration.h
//  ODY
//
//  Created by ODY_MuHao on 2016/1/4.
//  Copyright © 2016年 ODY. All rights reserved.
//

#ifndef Configuration_h
#define Configuration_h

#import "UIColor+ODY.h"

#define ProjectLabel @"didiSteel" // router常量

// 域名 frontdd.odianyun.local 开发环境 192.168.1.176 主干环境 192.168.1.230
#define AppApiDomain @"http://stg.steel.oudianyun.com"

//高德 Apikey
#define ammapApiKey @"95cf040ea7f761903e3cb093d908aa5a"

// 极光推送
#define JPushAppKey @"204b8f27ff9217345bcfec05" // todel测试的key
#define JPushChannel @"APPStore"
#define JPushIsProduction FALSE

// alipaycallback schema
#define ALIPAY_CALLBACK_SCHEMA @"alipaycallback"

#define DefaultCityName @"上海市"
#define DefaultProvinceName @"上海市"
#define DefaultProvinceId @"1"

// 异常提示
#define SERVER_ABNORMAL @"哎呀,网络又不给力了"

#define UploadFileParamName @"HttpServletRequest" // 上传文件接口文件数据的参数名。

/**
 *  通用颜色配置
 */
#define ThemeColor [UIColor fromInteger:0xFF8903]       // 主题色
#define MainBGColor [UIColor fromInteger:0xEBEBEB]      // 主背景色
#define PlaceholderColor [UIColor fromInteger:0x999999] // 通用占位符颜色。
#define NoEditBGColor [UIColor fromInteger:0xCCCCCC]    //不可编辑的背景色

// 辅色
#define AUXILIARY_COLOR_GREEN [UIColor fromInteger:0x3fae29]
#define AUXILIARY_COLOR_YELLOW [UIColor fromInteger:0xffb718]
#define AUXILIARY_COLOR_BLUE [UIColor fromInteger:0x00b2e2]

// 字体颜色
#define FontColorBlack [UIColor fromInteger:0x333333]    // 自定义文本黑色。
#define FontColorDarkGray [UIColor fromInteger:0X666666] // 深灰色。
#define FONT_COLOR_LIGHTGRAY [UIColor fromInteger:0x999999]

// 分割线颜色
#define DividerColor [UIColor fromInteger:0xe5e5e5]
// 登陆注册用到的线的颜色
#define LINE_COLOR [UIColor fromInteger:0xd8d8d8]

// 不同机型宽高比
#define WIDTH_SCALE [ODYTools getScreenWidthscale]
#define HEIGHT_SCALE [ODYTools getScreenHightscale]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
#define ImageNamed(name) [UIImage imageNamed:name]

/**
 * 通用图片资源
 */
#define IconErrorMessage @"fail"      // 提示错误时的图标。
#define IconSuccessMessage @"success" // 提示成功时的图标。

/**
 * 登录注册相关图片资源
 */
#define BGLoginImage @"无"                     // 登录背景图片。
#define IconMerchantLogo @"logo"               // 商家logo。
#define IconBackForFullScreenPage @"user_back" // 全屏页面返回键图标。
#define IconPhoneForInput @"user_phone"        // 输入框的电话图标。
#define IconPassword @"user_Locked"            // 密码图标。
#define IconUnselect @"select"                 // 未选中时的图标。
#define IconSelected @"user_-select"           // 选中时的图标。

/**
 * 登录注册模块颜色
 */
#define LoginGetCaptchasColor ThemeColor                          // 获取验证码文字颜色。
#define LoginPlaceholderColor PlaceholderColor                    // 注册页面提示语颜色。
#define RegisterUserAgreementColor [UIColor fromInteger:0x666666] // 注册页面协议颜色。
#define RegisterAgreementColor [UIColor fromInteger:0x666666]     //注册页面协议中同意两个字的颜色
#define LoginTextFieldBGColor [UIColor fromInteger:0xFFFFFF]      // 登录注册输入框背景色。
#define LoginTextFieldBorderColor [UIColor fromInteger:0xFFFFFF]  // 登录注册输入框边线
#define LoginTextFieldTextColor [UIColor fromInteger:0x333333]    // 登录注册输入框文字。

/**
 * 单元格常规缩放尺寸。
 */
#define CellEdgeInsets UIEdgeInsetsMake(0, 10, 0, 10)

/**
 * 登录注册模块 页面布局尺寸
 */
#define LoginBackIconTop 24  // 登录页 返回按钮 图标top值。
#define LoginBackIconLeft 20 // 登录页 返回按钮 图标left值。
#define LoginBackIconSize 34 // 登录页 返回按钮 图标尺寸值。

#define LoginLogoIconTop 78   // 登录页 返回按钮 图标top值。
#define LoginLogoIconSize 125 // 登录页 返回按钮 图标尺寸值。

#define LoginPhoneCellTop 35                       // 登录页 手机号单元格top值。
#define LoginPhoneCellLeft 35                      // 登录页 手机号单元格left值。
#define LoginPhoneCellGap (30 / 2)                 // 登录页 手机号单元格间隔。
#define LoginPhoneCellHeight (96 / 2)              // 登录页 手机号单元格高度。
#define LoginButtonCellHeight ((88 + 26 + 56) / 2) // 登录页 手机号单元格高度。

#define LoginButtonHeight (88 / 2)       // 登录页 注册按钮高度。
#define LoginCaptchasButtonLeftOffset 10 // 登录页 验证码登录左侧偏移尺寸。
#define LoginCheckButtonOffset 5         // 注册页 协议选中按钮的偏移尺寸。

//分类模块 页面布局尺寸
#define FirstCategoryTableViewWidth 90                 //分类页 一级分类tableview的宽度
#define FirstCategoryCellHeight 80                     //分类页 一级分类tableview的高度
#define FirstCategoryIconHeight 22                     //分类页 一级分类图片的高度
#define FirstCategoryIconWidth FirstCategoryIconHeight //分类页 一级分类图片的宽度
#define FirstCategoryIconTop 22                        //分类页 一级分类图片的top值
#define FirstCategoryTextBottom 22                     //分类页 一级分类图片的bottom值
//分类模块颜色

// 以前的 API接口。
// 选择车型
#define CAR_BUSINESSNAME @"api/owner/my/car"
// 添加车辆
#define ADDCAR_METHODNAME @"addCar"
// 品牌列表
#define BRANDGROUPLIST_METHODNAME @"brandGroupList"
// 删除车辆
#define DELETECAR_METHODNAME @"deleteCar"
// 排量列表
#define ENGINELIST_METHODNAME @"engineList"
// 车系列表
#define SERIESLIST_METHODNAME @"seriesList"
// 年款列表
#define YEARTYPELIST_METHODNAME @"yearTypeList"
// 我的车辆
#define MYCARLIST_METHODNAME @"myCarList"
// 根据 VIN 码添加车辆
#define ADDCARWITHVIN_METHODNAME @"carStyleList"

// 首页车辆 logo
#define HOMECARLOGO_BUSINESSNAME @"api/owner/home"
#define HOMECARLOGO_METHODNAME @"logo"

// 搜索
#define SEARCH_BUSINESSNAME @"api/owner/search"
// 搜索历史记录
#define SEARCHHISTORY_METHODNAME @"searchHistoryList"
// 热搜词
#define SEARCHHOTWORDLIST_METHODNAME @"hotWordList"
// 清除历史记录
#define SEARCHCLEANHISTORY_METHODNAME @"cleanSearchHistory"
// 诊断师结果列表
#define SEARCHCDOCTORSEARCHLIST_METHODNAME @"doctorSearchList"
// 门店结果列表
#define SEARCHMERCHANTSEARCHLIST_METHODNAME @"merchantSearchList"

// 服务
#define SERVICE_BUSINESSNAME @"api/serving/ownerservice"
// 服务列表
#define SERVICE_METHODNAME @"list"

//工单详情
#define WORKSHEETDETAIL_BUSINESSNAME @"api/serving/worksheet"
#define WORKSHEETDETAIL_METHODNAME @"detail"
#define ADDQUICKSERVICEWORKSHEET_METHODNAME @"addQuickServiceWorkSheet"

// 预约
#define APPOINT_BUSINESSNAME @"api/owner/appoint"
#define ADDAPPOINT_METHODNAME @"addAppoint"
#define CARLIST_METHODNAME @"carList"
#define MERCHANTINFO_METHODNAME @"merchantInfo"
#define APPOINTTIMELIST_METHODNAME @"appointTimeList"
#define SERVICETYPELIST_METHODNAME @"serviceTypeList"
#define TECHNICIANSTATUSLIST_METHODNAME @"technicianStatusList"

// 评论
#define COMMENT_BUSINESSNAME @"api/serving/comment"
#define MERCHANTCOMMENT_METHODNAME @"merchantCommentList"
#define TECHNICIANCOMMENT_METHODNAME @"technicianCommentList"

//工单是否同意
#define ORKSHEETDETAIL_AGREE_METHODNAME @"agreeWorksheet"

//城市列表
#define HOMEPAGE_LOCATION_TABLEVIEW_BUSINESSNAME @"api/owner/location"

//判断城市开通服务
#define HOMEPAGE_LOCATION_CITYINFO_TABLEVIEW_METHNAME @"cityInfo"

//意见反馈
#define SETTING_PROPOSEFEED_BUSINESSNAME @"api/serving/suggestion"
#define SETTING_PROPOSEFEED_METHNAME @"saveSuggestion"

// 诊断师详情
#define DIAGNOSE_BUSINESSNAME @"api/owner/appointment"
#define DIAGNOSEDETAIL_METHODNAME @"getDiagnosticianInfo"

//服务项目
#define APPOINTMENTSERVICEITEM_BUSINESSNAME @"api/serving/merchant"

//项目类目
#define APPOINTMENTSERVICEITEM_CATEGORY_METHODNAME @"serviceTree"

//服务列表
#define APPOINTMENTSERVICEITEM_SERVICE_LIST_METHODNAME @"serviceList"

//工序列表
#define APPOINTMENTSERVICEITEM_SERVICEdETAIL_LIST_METHODNAME @"serviceDetail"

//消息列表
#define MINE_MESSAGELIST_BUSINESSNAME @"api/serving/message"

#define MINE_MESSAGELIST_METHODNAME @"list"

//预约单详情
#define SERVICE_APPOINTMENT_DETAIL_BUSINESSNAME @"api/serving/appoint"

#define SERVICE_APPOINTMENT_DETAIL_METHODNAME @"detail"

#define SERVICE_APPOINTMENT_DETAIL_CANCELREASON_METHODNAME @"ownerCancelReason"

#define SERVICE_APPOINTMENT_DETAIL_CANCEL_METHODNAME @"cancel"

//评价
#define ORDER_JUDGES_BUSINESSNAME @"api/serving/comment"

#define ORDER_JUDGES_LIST_METHODNAME @"myCommentList"

#define ORDER_JUDGES_INIT_WORK_COMMENT_METHODNAME @"initWorkOrderComment"

#define ORDER_JUDGES_ADDWORKCOMMENT_METHODNAME @"addWorkOrderComment"

#define ORDER_JUDGES_ADD_QUICK_WORKCOMMENT_METHODNAME @"addFastServiceComment"

// 诊断单详细
#define DIAGNOSIS_BUSINESSNAME @"api/serving/diagnosis"
#define DIAGNOSIS_METHODNAME @"detail"
//订单
#define MY_ORDER_LIST_BUSINESSNAME @"api/owner/my/order"
#define DIAGNOSIS_DETAIL_METHODNAME @"detail"
#define MY_ORDER_LIST_METHODNAME @"list"

#define MY_ORDER_DETAIL_METHODNAME @"detail"

//支付方式
#define PAY_METHOD_LIST_BUSINESSNAME @"api/checkout"

#define PAY_METHOD_LIST_METHODNAME @"getPayGateway"

// cms
#define HOMEPAGE_CMS_BUSINESSNAME @"page"
#define HOMEPAGE_CMS_METHODNAME @"showArticleURL"

// 投诉
#define COMPLAINT_BUSINESSNAME @"api/owner/complaint"
#define COMPLAINTLIST_METHODNAME @"list"
#define COMPLAINTDETAIL_METHODNAME @"detail"
#define COMPLAINTCANCEL_METHODNAME @"cancel"
#define COMPLAINTADD_METHODNAME @"add"

#endif /* Configuration_h */
