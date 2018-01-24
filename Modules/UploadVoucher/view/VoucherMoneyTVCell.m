//
//  PaymentVoucherTVCell.m
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "VoucherMoneyTVCell.h"

@implementation VoucherMoneyTVCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self bindCellView];
    }
    return self;
}

- (void)bindCellView
{
    self.tipLabel = [UILabel autolayoutView];
    self.tipLabel.text = @"订单金额:";
    self.tipLabel.textAlignment = NSTextAlignmentRight;
    self.tipLabel.textColor = [UIColor fromString:@"333333"];
    self.tipLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.tipLabel];

    [self.tipLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(@(15));
        make.top.equalTo(self.contentView);
        make.width.equalTo(70);
        make.centerY.equalTo(self.contentView);
    }];

    self.priceLabel = [UILabel autolayoutView];
    self.priceLabel.text = @"¥135000";
    self.priceLabel.textAlignment = NSTextAlignmentLeft;
    self.priceLabel.textColor = [UIColor orangeColor];
    self.priceLabel.font = [UIFont systemFontOfSize:12];
    [self.contentView addSubview:self.priceLabel];

    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tipLabel.right).offset(5);
        make.top.equalTo(self.tipLabel);
        make.width.equalTo(self.tipLabel);
        make.centerY.equalTo(self.tipLabel);
    }];
}
@end
