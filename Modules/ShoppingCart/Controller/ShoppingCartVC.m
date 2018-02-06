//
//  ShoppingCartVC.m
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/1/22.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "ShoppingCartVC.h"
#import "ShoppingCartTVCell.h"
#import "ApiShoppingCart.h"
#import "ShoppingCartTools.h"
@interface ShoppingCartVC ()
@property (nonatomic, assign) int page;


@end

@implementation ShoppingCartVC



+ (void)load{
    [ODYRouter registerClass:self key:@"ShoppingCartVC"];
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
     [self updateShoppingCartList];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
  
    [self setNaviTitle:@"购物车"];
    self.showBlankTips = YES;
    self.cellClass = [ShoppingCartTVCell class];
    self.navigationItem.rightBarButtonItem = [ViewUtil RightBarButtonForText:@"清空" target:self action:@selector(onClearButton:)];
    [self creatBottomView];
}

- (void)creatBottomView
{
    self.bottomView = [[ShoppingCartPanelView alloc]initWithFrame:CGRectMake(0, self.view.bounds.size.height-49, ScreenWidth, 49)];
    self.bottomView.hidden = YES;
    Strong2Weak;
    self.bottomView.cartSelectedAllBlock = ^(ShoppingCartPanelView *shoppingCartPanelView) {
        Weak2Strong;
        if ([self.items count] <= 0) {
            self.bottomView.selectedAllBtn.selected = NO;
        }else{
            self.bottomView.selectedAllBtn.selected = !self.bottomView.selectedAllBtn.selected;
        }
        NSString *stockTips = nil;
        for (NSMutableDictionary *dic in self.items) {
            [dic setBool:self.bottomView.selectedAllBtn.selected forKey:CKSelect];
//            if ([dic hasKey:@"stockNum" ]&&[dic getInt:@"stockNum"] <= 0) {
//                [dic setBool:NO forKey:CKSelect];
//                if (stockTips == nil) {
//                    stockTips = [NSString stringWithFormat:@"%@ %@ %@ 已售罄", [dic getString:@"manufacturer"], [dic getString:@"mpName"], [dic getString:@"standard"]];
//                }
//            }
            if (self.bottomView.selectedAllBtn.selected && stockTips != nil) {
                [self showError:stockTips];
            }
        }
        [self.bottomView updateStatus:self.items];
        [self.tableView reloadData];
    };
    
    self.bottomView.cartOrdersBlock = ^{
        Weak2Strong;
        //检查用户是否已登录
        if ([ODYGlobalValue isLogin]) {
            //如果已经登录 再检查库存 库存没问题跳转到提交订单页面
            [self gotoCartSettle];
        }else{
            [ODYRouter gotoPage:@"phoneLogin"];
        }
    };
    
    
    [self addBottomButton:self.bottomView hasTabBar:YES];
}

/**
 去结算
 */
- (void)gotoCartSettle
{
    int count = 0;
    NSString *mpIds = [NSString string];
    for (int i = 0; i < self.items.count; i++) {
        NSMutableDictionary *item = [self.items getMutableDict:i];
        if (![item getBool:CKSelect]) {
            continue;
        }
        if (count > 0) {
            mpIds = [mpIds stringByAppendingString:@","];
        }
        count++;
        mpIds = [mpIds stringByAppendingString:[item getString:@"mpId"]];
    }
    if (count <= 0) {
        [self showError:@"请选择商品"];
        return;
    }
//    [self showLoading];
    [ApiShoppingCart cartSettleCartItemMpIds:mpIds callback:^(DataSilentLoader *silentLoader, DataResult *result) {
        if ([DataResult checkResultOK:result]) {
//            [self hideLoading];
                [ODYRouter gotoPage:@"confirmOrder" param:@{ @"mpIds" : mpIds ,@"animationType" : @2 }];
            
        }
    }];
    
    
}

- (void)updateShoppingCartList{
    
    [self showLoading];
    Strong2Weak;
    [ApiShoppingCart getCartItemListCallback:^(DataSilentLoader *silentLoader, DataResult *result) {
        [self hideLoading];
        if ([DataResult checkResultOK:result]){
            [weakSelf preprocess:[result.items getMutableArray]];
        }
    }];
}
- (void)preprocess:(NSMutableArray *)array
{
    for (int i = 0; i < array.count; i++) {
        NSMutableDictionary * item = [array getMutableDict:i];
        [item setDouble:10.0 forKey:CKHeaderHeight];
        [item setInt:(int)UIRectCornerAllCorners forKey:CKCornerType];
        if ([ShoppingCartTools isSelect:[item getString:@"mpId"]]) {
            [item setBool:YES forKey:CKSelect];
        }
    }
    [[array getMutableDict:[array count]-1] setDouble:10.0 forKey:CKFooterHeight];
    self.items = array;
    [self.bottomView updateStatus:self.items];
}

- (BOOL)onCellButton:(NSMutableDictionary *)detail
{
    switch ([detail getInt:CKAction]) {
        case CellActionSelect:
            [self onSelect:detail];
            break;
        case CellActionDelete:
            [self onDelete:detail];
            break;
        default:
            break;
    }
    return YES;
}
- (void)onSelect:(NSMutableDictionary*)detail
{
    [self.bottomView updateStatus:self.items];
}
- (void)onClearButton:(UIButton *)button
{
    if (self.items.count) {
        Strong2Weak;
        BaseAlertView *alertView = [BaseAlertView alertWithTitle:nil message:@"清空购物车里的商品？" leftBtn:@"取消" rightBtn:@"确定" dataChannel:nil andCompleteBlock:^(BaseAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                [weakSelf clearShopCatr];
            }
        }];
        [alertView show];
    }else{
        [self showMessage:@"没有商品可删除"];
    }
}

//清空购物车
- (void)clearShopCatr
{
    [self showLoading];
    [ApiShoppingCart clearCartItemCallback:^(DataSilentLoader *silentLoader, DataResult *result) {
        [self hideLoading];
        if ([DataResult checkResultOK:result]) {
            //清除本地数据
           
            [self.items removeAllObjects];
            [self.bottomView updateStatus:self.items];
            [self.tableView reloadData];
        }
    }];
}

- (void)onDelete:(NSMutableDictionary *)detail
{
  
    
        BaseAlertView *alertView = [BaseAlertView alertWithTitle:nil message:@"清空购物车里的商品？" leftBtn:@"取消" rightBtn:@"确定" dataChannel:nil andCompleteBlock:^(BaseAlertView *alertView, NSInteger buttonIndex) {
            if (buttonIndex == 1) {
                [self delectedShopCartWithShopCart:detail];
            }
        }];
        [alertView show];
    
}

//根据id删除购物车
- (void)delectedShopCartWithShopCart:(NSMutableDictionary *)shopCart
{
    [self showLoading];
    NSString * mpId = [shopCart getString:@"mpId"];
    [ApiShoppingCart delCartItemMpIds:mpId callback:^(DataSilentLoader *silentLoader, DataResult *result) {
         [self hideLoading];
        if ([DataResult checkResultOK:result]) {
            [self removeGoodsById:mpId];
        }
    }];
}
- (void)removeGoodsById:(NSString *)mpId
{
    for (NSMutableDictionary * item in self.items) {
        if ([[item getString:@"mpId"] isEqualToString:mpId]) {
            [self.items removeObject:item];
            break;
        }
    }
    [ShoppingCartTools removeGoodsById:mpId];
    [self.bottomView updateStatus:self.items];
    [self.tableView reloadData];
}

#pragma mark - 空白提示需要的代理函数

// 图标文件名。
- (NSString *)blankTipsIcon
{
    return @"no_-invoice";
}

// 提示标题。
- (NSString *)blankTipsTitle
{
    return @"您的购物车还没有任何商品";
}

// 提示内容。
- (NSString *)blankTipsContent
{
    return nil;
}

// 下一步行动名称。
- (NSString *)blankTipsNextAction
{
    return @"去逛逛";
}

- (void)nextActionAfterBlank
{
    [ODYRouter popAllToHome];
}


@end
