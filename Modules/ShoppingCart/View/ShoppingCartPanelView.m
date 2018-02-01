//
//  ShoppingCartPanelView.m
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/2/1.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "ShoppingCartPanelView.h"

@implementation ShoppingCartPanelView

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self layoutUI];
    }
    return self;
}

-(void)layoutUI
{
    self.layer.borderWidth = 0.5;
    self.layer.borderColor = [UIColor fromInteger:0xEEEEEE].CGColor;
    self.backgroundColor = [UIColor fromInteger:0xFFFFFF];
    self.selectedAllBtn = [ViewUtil createButton:@"全选" target:self action:@selector(onSelectedAll) image:@"selected_2" highImage:@"selected_1"];
    
    self.selectedAllBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.selectedAllBtn setTitleColor:[UIColor fromString:@"666666"] forState:UIControlStateNormal];
    [self.selectedAllBtn setLayout:HJImageLeftTitleRightStyle spacing:5];
    [self addSubview:self.selectedAllBtn];
    
    [self.selectedAllBtn makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(15);
        make.top.bottom.equalTo(self);
        make.width.equalTo(60);
    }];
    
    self.ordersButton = [ViewUtil normalButtonForText:@"去结算(0)" target:self action:@selector(clickToOrders)];
    self.ordersButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.ordersButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.ordersButton.backgroundColor = NoEditBGColor;
    [self addSubview:self.ordersButton];
    
    [self.ordersButton makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self);
        make.height.equalTo(self);
        make.width.equalTo(100);
        make.centerY.equalTo(self);
    }];
    
    self.priceLabel = [[UnitPriceLabel alloc] initWithUnitPriceType:UnitPriceTypeTotalPrice fontSizeMargin:7.0];
    self.priceLabel.textColor = ThemeColor;
    self.priceLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:self.priceLabel];
    self.priceLabel.hidden = YES;
    
    
    self.weightLabel = [UILabel autolayoutView];
    self.weightLabel.textColor = FontColorBlack;
    self.weightLabel.font = [UIFont systemFontOfSize:12];
    [self addSubview:self.weightLabel];
    self.weightLabel.hidden = YES;
    
    [self makeConstraints];
}


-(void)makeConstraints
{
    [self.priceLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(6);
        make.left.equalTo(self.selectedAllBtn.right).offset(8);
        make.width.greaterThanOrEqualTo(10);
        make.height.equalTo(20);
    }];
    
    [self.weightLabel makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLabel);
        make.width.greaterThanOrEqualTo(10);
        make.bottom.equalTo(self.mas_bottom).offset(-6);
    }];
}

- (void)updateStatus:(NSArray *)items
{
    self.totalPrices = 0.0;
    self.totalWeights = 0.000;
    int count = 0;
    for (NSMutableDictionary *item in items) {
        if (![item getBool:CKSelect]) {
            continue;
        }
        count++;
        double price = [item getDouble:@"totalPrice"];
        double weight = [item getDouble:@"weight"];
        self.totalWeights += weight;
        self.totalPrices += price;
    }
    if (items.count <= 0) {
        self.hidden = YES;
        self.selectedAllBtn.selected = NO;
    }else{
        self.hidden = NO;
        self.selectedAllBtn.selected = count == items.count;
    }
    [self hiddenPriceAndWeightLabelBool:count <= 0];
    self.ordersCount = count;
    [ShoppingCartTools updateShoppingCart:items];
}

-(void)setTotalPrices:(CGFloat)totalPrices{
    _totalPrices = totalPrices;
    self.priceLabel.text = [NSString stringWithFormat:@"%.02f", _totalPrices];
}
- (void)setTotalWeights:(CGFloat)totalWeights
{
    _totalWeights = totalWeights;
    self.weightLabel.text = [NSString stringWithFormat:@"共 %.03f吨", _totalWeights];
}
-(void)setOrdersCount:(NSInteger)ordersCount
{
    _ordersCount = ordersCount;
    if (ordersCount > 0) {
        self.ordersButton.enabled = YES;
        [self.ordersButton setBackgroundColor:ThemeColor];
    }else{
        self.ordersButton.enabled = NO;
        [self.ordersButton setBackgroundColor:NoEditBGColor];
    }
    NSString *countStr = [NSString stringWithFormat:@"去结算(%ld)", (long)_ordersCount];
    
    [self.ordersButton setTitle:countStr forState:UIControlStateNormal];
}

- (void)onSelectedAll{
    if (self.cartSelectedAllBlock) {
        self.cartSelectedAllBlock(self);
    }
}

- (void)clickToOrders
{
    if (self.cartOrdersBlock)
    {
        self.cartOrdersBlock();
    }
}

- (void)hiddenPriceAndWeightLabelBool:(BOOL)isHidden
{
    if (isHidden)
    {
        self.weightLabel.hidden = YES;
        self.priceLabel.hidden = YES;
    }
    else
    {
        self.weightLabel.hidden = NO;
        self.priceLabel.hidden = NO;
    }
}



@end
