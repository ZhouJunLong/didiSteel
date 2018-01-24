//
//  HomePageListTVCell.h
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/1/22.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "FormBasicTVCell.h"

@interface HomePageListTVCell : FormBasicTVCell
@property (nonatomic, strong) UILabel *nameLabel; // 品名。
@property (nonatomic, strong) UILabel *merchant;  // 商家。
@property (nonatomic, strong) UILabel *standards; // 规格。
@property (nonatomic, strong) UILabel *material;  // 材质。
@property (nonatomic, strong) UILabel *cityLabel; // 城市。
@property (nonatomic, strong) UILabel *warehouse; // 仓库。
@property (nonatomic, strong) UILabel *weight;    // 重量。
@property (nonatomic, strong) UILabel *company;   // 公司。

@property (nonatomic, strong) UIButton *buyButton;     // 购买按钮。
@property (nonatomic, strong) UIButton *btnImagePhone; // 电话咨询图片按钮。
@property (nonatomic, strong) UIButton *btnTitlePhone; // 电话咨询文字按钮。

@property (nonatomic, strong) UIView *backImage; // 价格和立即购买的背景图。

@property (nonatomic, strong) UnitPriceLabel *currentPriceLabel;   // 现价。
@property (nonatomic, strong) UnitPriceLabel *referancePriceLabel; // 参考价。
@end
