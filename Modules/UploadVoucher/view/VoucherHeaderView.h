//
//  VoucherHeaderView.h
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^selectedImgBlock) ();

typedef void (^checkSampleBlock) ();

@interface VoucherHeaderView : UIView

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *tipLabel1; // 提示1

@property (nonatomic, strong) UIButton *selectedImgButton;

@property (nonatomic, strong) UILabel *tipLabel2; // 提示1

@property (nonatomic, strong) UIButton *sampleButton; // 样本

@property (nonatomic, strong) UILabel *tipLabel3; // 提示1

@property (nonatomic, copy) selectedImgBlock imgButtonBlock;

@property (nonatomic, copy) checkSampleBlock sampleBlock;

@end
