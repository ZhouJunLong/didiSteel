//
//  ShoppingCartTVCell.h
//  ODY
//
//  Created by demo.zheng on 2016/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "FormBasicTVCell.h"
#import "UnitPriceLabel.h"

@interface ShoppingCartTVCell : FormBasicTVCell

@property (nonatomic, strong) UILabel *placeLabel;        // 产地或厂商
@property (nonatomic, strong) UnitPriceLabel *priceLabel; // 价格或单价
@property (nonatomic, strong) UILabel *nameLabel;         // 品名
@property (nonatomic, strong) UILabel *warehouse;         // 仓库
@property (nonatomic, strong) UILabel *city;              // 所在地

@property (nonatomic, strong) UILabel *weight;     // 重量
@property (nonatomic, strong) UILabel *totalPrice; // 总价
@property (nonatomic, strong) UILabel *standard;   // 规格
@property (nonatomic, strong) UILabel *texture;    // 材质

@property (nonatomic, strong) UILabel *weightUnit; //

@property (nonatomic, strong) UIButton *selectButton; // 选择按钮
@property (nonatomic, strong) UIButton *deleteButton; // 删除按钮

@end
