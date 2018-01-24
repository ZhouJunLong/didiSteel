//
//  VoucherHeaderView.m
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "VoucherHeaderView.h"

@implementation VoucherHeaderView

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
    self.titleLabel = [UILabel autolayoutView];
    self.titleLabel.text = @"填写打款金额";
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    self.titleLabel.textColor = [UIColor fromString:@"333333"];
    self.titleLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.titleLabel];

    [self.titleLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(@(15));
        make.top.equalTo(self).offset(10);
        make.width.equalTo(100);
    }];

    self.tipLabel1 = [UILabel autolayoutView];
    self.tipLabel1.text = @"*交易凭证:";
    self.tipLabel1.textAlignment = NSTextAlignmentRight;
    self.tipLabel1.textColor = [UIColor fromString:@"333333"];
    self.tipLabel1.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.tipLabel1];

    [self.tipLabel1 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(@(15));
        make.top.equalTo(self.titleLabel.bottom).offset(5);
        make.width.equalTo(80);
    }];

    self.selectedImgButton = [ViewUtil normalButtonForText:@"选择图片" target:self action:@selector(onClickSelectImage)];
    self.selectedImgButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.selectedImgButton setTitleColor:[UIColor fromString:@"333333"] forState:UIControlStateNormal];
    self.selectedImgButton.layer.borderColor = [UIColor orangeColor].CGColor;
    self.selectedImgButton.layer.borderWidth = 0.5;
    [self addSubview:self.selectedImgButton];

    [self.selectedImgButton makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.tipLabel1.right).offset(10);
        make.top.equalTo(self.titleLabel.bottom).offset(10);
        make.width.equalTo(100);
        make.height.equalTo(60);
    }];

    self.tipLabel2 = [UILabel autolayoutView];
    self.tipLabel2.text = @"请上传文件";
    self.tipLabel2.textAlignment = NSTextAlignmentCenter;
    self.tipLabel2.textColor = [UIColor fromString:@"999999"];
    self.tipLabel2.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.tipLabel2];

    [self.tipLabel2 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.selectedImgButton.right);
        make.top.equalTo(self.titleLabel.bottom).offset(5);
        make.width.equalTo(80);
    }];

    self.sampleButton = [ViewUtil normalButtonForText:@"样本" target:self action:@selector(clickOnSampleButton)];
    self.sampleButton.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.sampleButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    self.sampleButton.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self addSubview:self.sampleButton];

    [self.sampleButton makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.tipLabel2);
        make.right.equalTo(self).offset(-10);
        make.width.equalTo(30);
        make.height.equalTo(15);
    }];

    self.tipLabel3 = [UILabel autolayoutView];
    self.tipLabel3.text = @"格式要求：png、jpg图片文件，文件大小小于500k";
    self.tipLabel3.textAlignment = NSTextAlignmentRight;
    self.tipLabel3.textColor = [UIColor fromString:@"999999"];
    self.tipLabel3.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.tipLabel3];

    [self.tipLabel3 makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.bottom.equalTo(self).offset(-5);
        make.width.equalTo(self).offset(-30);
    }];
}

- (void)clickOnSampleButton
{
    if (self.sampleBlock)
    {
        self.sampleBlock();
    }
}

- (void)onClickSelectImage
{
    if (self.imgButtonBlock)
    {
        self.imgButtonBlock();
    }
}

@end
