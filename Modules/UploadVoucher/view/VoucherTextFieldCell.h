//
//  VoucherTextFieldCell.h
//  DiDiSteel
//
//  Created by demo.zheng on 16/6/15.
//  Copyright © 2016年 ODY. All rights reserved.
//

#import "BaseTVCell.h"

@interface VoucherTextFieldCell : BaseTVCell <UITextFieldDelegate>

@property (nonatomic, strong) UILabel *tipLabel; // 提示

@property (nonatomic, strong) UITextField *textField; // 输入框
@end
