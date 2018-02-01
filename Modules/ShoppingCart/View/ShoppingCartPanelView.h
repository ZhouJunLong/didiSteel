//
//  ShoppingCartPanelView.h
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/2/1.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ShoppingCartPanelView;

/**
 全选按钮
 */
typedef void (^CartSelectedAllBlock)(ShoppingCartPanelView *shoppingCartPanelView);

typedef void (^CartOrdersBlock)(void);

@interface ShoppingCartPanelView : UIView


@property (nonatomic, strong) UILabel *weightLabel;       // 总重量
@property (nonatomic, strong) UnitPriceLabel *priceLabel; // 总价
@property (nonatomic, strong) UIButton *selectedAllBtn;   // 全选按钮
@property (nonatomic, strong) UIButton *ordersButton;     // 下单按钮

@property (nonatomic, copy) CartSelectedAllBlock cartSelectedAllBlock;
@property (nonatomic, copy) CartOrdersBlock cartOrdersBlock;

@property (nonatomic, assign) CGFloat totalWeights;  // 总重量
@property (nonatomic, assign) CGFloat totalPrices;   // 总价格
@property (nonatomic, assign) NSInteger ordersCount; // 选中的数量


/**
 更新下方的状态

 @param items 
 */
- (void)updateStatus:(NSArray *)items;

@end
