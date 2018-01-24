//
//  UnitPriceLabel.h
//  ODYFramework
//
//  Created by enfu.niu on 2016/7/5.
//  Copyright © 2016年 enfu.niu. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum : NSUInteger
{
    UnitPriceTypeNormal,         // 不显示吨位的单价
    UnitPriceTypeCurrentPrice,   // 现价。
    UnitPriceTypeReferencePrice, // 参考价。
    UnitPriceTypeTotalPrice,     // 总价

} UnitPriceType;

@interface UnitPriceLabel : UILabel

- (instancetype)initWithUnitPriceType:(UnitPriceType)unitPriceType fontSizeMargin:(CGFloat)fontMargin;

@end
