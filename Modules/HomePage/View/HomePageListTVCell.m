//
//  HomePageListTVCell.m
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/1/22.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "HomePageListTVCell.h"

#define InsideMargin 14
#define LeftMargin 10
#define RightMargin LeftMargin

@implementation HomePageListTVCell

-(void)bindCellView{
    [super bindCellView];
    self.backImage = [self addView];
    self.nameLabel = [self addBoldLabel:14.0];
    self.standards = [self addLabel:14.0];
    self.material = [self addLabel:14.0];
    self.merchant = [self addLabel:14.0];
    self.cityLabel = [self addLabel:12.5];
    self.warehouse = [self addLabel:12.5];
    self.weight = [self addLabel:12.5];
    self.company = [self addLabel:11.5];
    
    self.currentPriceLabel = [[UnitPriceLabel alloc]initWithUnitPriceType:UnitPriceTypeCurrentPrice fontSizeMargin:7.0];
    [self.contentView addSubview:self.currentPriceLabel];
    self.referancePriceLabel = [[UnitPriceLabel alloc] initWithUnitPriceType:UnitPriceTypeReferencePrice fontSizeMargin:3.0];
    [self.contentView addSubview:self.referancePriceLabel];
    
    self.buyButton = [self addButton:@"立即购买" action:@selector(buyButtonClick) normalImage:nil selectedImage:nil];
    self.btnImagePhone = [self addButton:@selector(callPhone) normalImage:@"telephone" selectedImage:@"telephone"];
     self.btnTitlePhone = [self addButton:@"电话咨询" action:@selector(callPhone) normalImage:nil selectedImage:nil];
    [self settingAttributing];
    [self makeConstraints];
}
- (void)settingAttributing
{
    self.nameLabel.textAlignment = NSTextAlignmentLeft;
    self.nameLabel.textColor = FontColorBlack;
    
    self.standards.textAlignment = NSTextAlignmentLeft;
    self.standards.textColor = FontColorBlack;
    
    self.material.textAlignment = NSTextAlignmentLeft;
    self.material.textColor = FontColorBlack;
    
    self.merchant.textAlignment = NSTextAlignmentLeft;
    self.merchant.textColor = FontColorBlack;
    
    self.cityLabel.textAlignment = NSTextAlignmentRight;
    self.cityLabel.textColor = FontColorDarkGray;
    
    self.warehouse.textAlignment = NSTextAlignmentRight;
    self.warehouse.textColor = FontColorDarkGray;
    
    self.weight.textAlignment = NSTextAlignmentRight;
    self.weight.textColor = FontColorDarkGray;
    
    self.btnImagePhone.imageView.contentMode = UIViewContentModeCenter;
    
    self.btnTitlePhone.titleLabel.font = [UIFont systemFontOfSize:11.5];
    [self.btnTitlePhone setTitleColor:[UIColor fromString:@"0066CC"] forState:(UIControlStateNormal)];
    
    self.company.textColor = PlaceholderColor;
    
    self.currentPriceLabel.textAlignment = NSTextAlignmentRight;
    self.currentPriceLabel.textColor = ThemeColor;
    self.currentPriceLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    
    self.referancePriceLabel.textAlignment = NSTextAlignmentRight;
    self.referancePriceLabel.textColor = PlaceholderColor;
    self.referancePriceLabel.font = [UIFont systemFontOfSize:13.0f];
    
    [self.buyButton setBackgroundColor:ThemeColor];
    
    self.backImage.backgroundColor = [UIColor fromInteger:0xF8F8F8];
}
- (void)makeConstraints
{
    [self.nameLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView.mas_top).offset(17);
        make.left.equalTo(self.contentView.mas_left).offset(LeftMargin);
    }];
    
    [self.standards makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.left.equalTo(self.nameLabel.mas_right).offset(InsideMargin);
    }];
    
    [self.material makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.left.equalTo(self.standards.mas_right).offset(InsideMargin);
    }];
    
    [self.merchant makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLabel);
        make.left.equalTo(self.material.mas_right).offset(InsideMargin);
        make.width.greaterThanOrEqualTo(10);
    }];
    
    [self.cityLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(12);
        make.left.equalTo(self.contentView.mas_left).offset(LeftMargin);
    }];
    
    [self.warehouse makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.cityLabel);
        make.left.equalTo(self.cityLabel.mas_right).offset(InsideMargin);
    }];
    
    [self.weight makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.warehouse);
        make.left.equalTo(self.warehouse.mas_right).offset(InsideMargin);
        make.width.greaterThanOrEqualTo(10);
    }];
    
    [self.btnImagePhone makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.cityLabel.mas_bottom).offset(12);
        make.left.equalTo(self.contentView).offset(10);
        make.width.and.height.equalTo(16);
    }];
    
    [self.btnTitlePhone makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.btnImagePhone);
        make.left.equalTo(self.btnImagePhone.mas_right).offset(7);
        make.width.greaterThanOrEqualTo(10);
    }];
    
    [self.company makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.btnTitlePhone);
        make.left.equalTo(self.btnTitlePhone.mas_right).offset(InsideMargin);
        make.width.greaterThanOrEqualTo(10);
    }];
    
    [self.backImage makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(44);
        make.left.and.right.bottom.equalTo(self.contentView);
    }];
    
    [self.buyButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.and.bottom.right.equalTo(self.backImage);
        make.width.greaterThanOrEqualTo(80);
    }];
    
    [self.currentPriceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.buyButton);
        make.left.equalTo(self.btnImagePhone);
    }];
    
    [self.referancePriceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.currentPriceLabel).offset(-0.5);
        make.left.equalTo(self.currentPriceLabel.mas_right).offset(4);
    }];
}
-(void)setAttribute:(NSMutableDictionary *)dict{
    self.nameLabel.text = [dict getString:@"productName"];
    self.standards.text = [dict getString:@"specificationValueName"];
    self.material.text = [dict getString:@"materialValueName"];
    self.merchant.text = [dict getString:@"manufacturerValueName"];
    
    self.cityLabel.text = [dict getString:@"cityName"];
    self.warehouse.text = [dict getString:@"wareHouseName"];
    self.weight.text = [NSString stringWithFormat:@"%@吨", [dict getWeight:@"weightInTon"]];
    
    self.currentPriceLabel.text = [dict getMoneyValue:@"price"];
    self.referancePriceLabel.text = [dict getMoneyValue:@"marketPrice"];
    self.company.text = [dict getString:@"providerName"];
    
     int stock = [dict getInt:@"stock"];
    
    
    if (stock <= 0)
    {
        [self.buyButton setTitle:@"已售罄" forState:(UIControlStateNormal)];
        self.buyButton.backgroundColor = NoEditBGColor;
        self.buyButton.enabled = NO;
    }
    else
    {
        [self.buyButton setTitle:@"立即购买" forState:(UIControlStateNormal)];
        self.buyButton.backgroundColor = ThemeColor;
        self.buyButton.enabled = YES;
    }
}
- (void)buyButtonClick
{
    [self.detail setValue:@"buy" forKey:CKAction];
    [super onCellButton];
}
+ (CGFloat)cellHeightWithData:(id)aData
{
    return (36 + 28 + 28 + 26 + 28 + 28 + 36 + 88) / 2.0;
}
- (void)callPhone
{
    NSString *tel = [self.detail getString:@"tel"];
    NSString *name = [self.detailDict getString:@"providerName"];
    
    [SysUtil callPhone:tel name:name];
}


@end
