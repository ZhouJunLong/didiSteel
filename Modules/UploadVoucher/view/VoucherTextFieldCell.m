//
//  VoucherTextFieldCell.m
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "VoucherTextFieldCell.h"

@implementation VoucherTextFieldCell
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
    self.tipLabel.text = @"*我已付款:";
    self.tipLabel.textAlignment = NSTextAlignmentCenter;
    self.tipLabel.textColor = [UIColor fromString:@"333333"];
    self.tipLabel.font = [UIFont systemFontOfSize:14];
    [self.contentView addSubview:self.tipLabel];

    [self.tipLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(@(10));
        make.top.equalTo(self.contentView);
        make.width.equalTo(80);
        make.centerY.equalTo(self.contentView);
    }];

    self.textField = [UITextField autolayoutView];
    self.textField.font = [UIFont systemFontOfSize:12];
    self.textField.clearButtonMode = UITextFieldViewModeAlways;
    self.textField.layer.borderWidth = 0.5f;
    self.textField.layer.borderColor = [UIColor orangeColor].CGColor;
    self.textField.keyboardType = UIKeyboardTypeDefault;
    [self.contentView addSubview:self.textField];

    [self.textField makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tipLabel.right).offset(5);
        make.top.centerY.equalTo(self.tipLabel);
        make.width.equalTo(120);
    }];
}

@end
