//
//  VoucherFooterView.h
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^confirmedBlock) ();

@interface VoucherFooterView : UIView

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIButton *confirmButton;

@property (nonatomic, copy) confirmedBlock confirmsBlock;

@end
