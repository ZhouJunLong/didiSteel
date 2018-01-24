//
//  VoucherFooterView.m
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "VoucherFooterView.h"

@implementation VoucherFooterView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        [self layoutUI];
    }
    return self;
}

- (void)layoutUI
{
    self.bgView = [self creatBgView];
    self.bgView.backgroundColor = [UIColor lightGrayColor];
    [self addSubview:self.bgView];

    [self.bgView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(10);
        make.left.right.equalTo(self);
        make.height.equalTo(80);
    }];

    self.confirmButton = [ViewUtil normalButtonForText:@"确定" target:self action:@selector(onConfirm)];
    [self.confirmButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.confirmButton setBackgroundColor:[UIColor orangeColor]];
    [self addSubview:self.confirmButton];
    [self bringSubviewToFront:self.confirmButton];

    [self.confirmButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.bottom).offset(20);
        make.width.equalTo(120);
        make.height.equalTo(40);
        make.centerX.equalTo(self);
    }];
}

- (UIView *)creatBgView
{
    UIView *view = [UIView autolayoutView];
    view.backgroundColor = [UIColor lightGrayColor];
    UILabel *label1 = [self creatLabel:@"嘀嘀拼钢收款账号："];
    [view addSubview:label1];

    [label1 makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(view).offset(5);
        make.width.equalTo(view);
    }];

    UILabel *label2 = [self creatLabel:@"开户行: 上海市商业银行股份有限公司浦东支行"];
    [view addSubview:label2];

    [label2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label1);
        make.top.equalTo(label1.bottom).offset(5);
        make.width.equalTo(view);
    }];

    UILabel *label3 = [self creatLabel:@"户名: XXXXXXXXXXXX有限公司"];
    [view addSubview:label3];

    [label3 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label2);
        make.top.equalTo(label2.bottom).offset(5);
        make.width.equalTo(view);
    }];

    UILabel *label4 = [self creatLabel:@"账号: 321 284 022 101 008 888 9995"];
    [view addSubview:label4];

    [label4 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(label3);
        make.top.equalTo(label3.bottom).offset(5);
        make.width.equalTo(view);
    }];

    return view;
}

- (UILabel *)creatLabel:(NSString *)title
{
    UILabel *label = [UILabel autolayoutView];
    label.text = title;
    label.textColor = [UIColor fromString:@"333333"];
    label.font = [UIFont systemFontOfSize:12];
    return label;
}

- (void)onConfirm
{
    if (self.confirmsBlock)
    {
        self.confirmsBlock();
    }
}
@end
