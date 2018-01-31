//
//  ShoppingCartTVCell.m
//  ODY
//
//  Created by demo.zheng on 2016/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "ShoppingCartTVCell.h"

@implementation ShoppingCartTVCell

- (void)bindCellView
{
    [super bindCellView];

    self.nameLabel = [self addBoldLabel:14];
    self.nameLabel.textColor = FontColorBlack;

    self.standard = [self addLabel:14];
    self.standard.textColor = FontColorBlack;

    self.texture = [self addLabel:14];
    self.texture.textColor = FontColorBlack;

    self.placeLabel = [self addLabel:14];
    self.placeLabel.textColor = FontColorBlack;

    self.city = [self addLabel:13];
    self.city.textColor = FONT_COLOR_LIGHTGRAY;

    self.warehouse = [self addLabel:14];
    self.warehouse.textColor = FONT_COLOR_LIGHTGRAY;

    self.weight = [self addLabel:14];
    self.weight.textColor = FONT_COLOR_LIGHTGRAY;

    self.priceLabel = [[UnitPriceLabel alloc] initWithUnitPriceType:UnitPriceTypeCurrentPrice fontSizeMargin:3.0];
    self.priceLabel.font = [UIFont systemFontOfSize:16];
    self.priceLabel.textColor = ThemeColor;
    [self.contentView addSubview:self.priceLabel];

    self.selectButton = [self addButton:@selector(clickToSelected:) normalImage:@"selected_2" selectedImage:@"selected_1"];

    self.deleteButton = [self addButton:@selector(clickToDelete) normalImage:@"shopping_cart_delete_1" selectedImage:@"shopping_cart_delete_2"];
    [self.deleteButton setImage:[UIImage imageNamed:@"shopping_cart_delete_2"] forState:(UIControlStateHighlighted)];

    [self customize];
    [self makeConstraints];
}

- (void)customize
{
    self.backgroundColor = MainBGColor;

    self.contentView.layer.cornerRadius = 7;
    self.contentView.layer.masksToBounds = YES;
}

- (void)makeConstraints
{
    [self.selectButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(32);
        make.left.equalTo(self.contentView.mas_left);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];

    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectButton.mas_right);
        make.top.equalTo(self.contentView).offset(18);
        make.width.greaterThanOrEqualTo(12);
    }];

    [self.standard makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(8);
        make.left.equalTo(self.nameLabel.mas_left);
        make.width.greaterThanOrEqualTo(12);
    }];

    [self.texture makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.standard.mas_right).offset(14);
        make.centerY.equalTo(self.standard.mas_centerY);
        make.width.greaterThanOrEqualTo(12);
    }];

    [self.placeLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_right).offset(14);
        make.centerY.equalTo(self.nameLabel.mas_centerY);
        make.width.greaterThanOrEqualTo(12);
    }];

    [self.city makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.top.equalTo(self.standard.mas_bottom).offset(8);
        make.width.greaterThanOrEqualTo(12);
    }];

    [self.warehouse makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.city.mas_right).offset(14);
        make.centerY.equalTo(self.city.mas_centerY);
        make.width.greaterThanOrEqualTo(12);
    }];

    [self.weight makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.warehouse.mas_right).offset(14);
        make.centerY.equalTo(self.warehouse.mas_centerY);
        make.width.greaterThanOrEqualTo(12);
    }];

    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLabel.mas_left);
        make.top.equalTo(self.city.bottom).offset(8);
        make.width.greaterThanOrEqualTo(12);
    }];

    [self.deleteButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView.mas_right);
        make.width.equalTo(32);
        make.top.equalTo(self.contentView.mas_top).offset(10);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10);
    }];
}

+ (CGFloat)cellHeightWithData:(id)aData
{
    return 122;
}

#pragma mark - Button action

- (void)clickToSelected:(UIButton *)button
{
    if ([self.detailDict hasKey:@"stockNum"] && [self.detailDict getInt:@"stockNum"] <= 0)
    {
        [self showError:@"该商品已售罄"];
        self.selectButton.selected = NO;
    }
    else
    {
        self.selectButton.selected = !button.selected;
    }

    [self.detailDict setInt:CellActionSelect forKey:CKAction];
    [self.detailDict setBool:self.selectButton.selected forKey:CKSelect];
    [super onCellButton];
}

- (void)clickToDelete
{
    [self.detailDict setInt:CellActionDelete forKey:CKAction];
    [super onCellButton];
}

- (void)setAttribute:(NSMutableDictionary *)dict
{
    self.nameLabel.text = [dict getString:@"mpName"];
    self.standard.text = [dict getString:@"standard"];
    self.texture.text = [dict getString:@"texture"];
    self.placeLabel.text = [dict getString:@"manufacturer"];
    self.city.text = [dict getString:@"warehouseCity"];
    self.warehouse.text = [dict getString:@"warehouseName"];
    self.priceLabel.text = [dict getMoneyValue:@"unitPrice"];
    self.weight.text = [NSString stringWithFormat:@"%@%@", [dict getWeight:@"weight"], [dict getString:@"weightUnit"]];

    self.selectButton.selected = [dict getBool:CKSelect];
}

@end
