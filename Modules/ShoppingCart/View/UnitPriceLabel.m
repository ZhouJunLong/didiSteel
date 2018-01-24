//
//  UnitPriceLabel.m
//  ODYFramework
//
//  Created by enfu.niu on 2016/7/5.
//  Copyright © 2016年 enfu.niu. All rights reserved.
//

#import "UnitPriceLabel.h"

#define MatchLetter @"/吨"

@interface UnitPriceLabel ()

//设置Label的类型
@property (nonatomic, assign) UnitPriceType unitPriceType;
//如果是参考价,添加的横线
@property (nonatomic, strong) UIView *line;
//如果是现价的话,字体的差值
@property (nonatomic, assign) CGFloat fontSizeMargin;
//如果是现价的话,字体的差值
@property (nonatomic, assign) CGFloat marginFontSize;

@end

@implementation UnitPriceLabel

- (instancetype)initWithUnitPriceType:(UnitPriceType)unitPriceType fontSizeMargin:(CGFloat)fontMargin
{
    self = [super init];
    if (self)
    {
        if (unitPriceType == UnitPriceTypeReferencePrice)
        {
            self.line = [[UIView alloc] init];
            [self addSubview:self.line];
        }
        self.unitPriceType = unitPriceType;

        if (fontMargin > 0)
        {
            self.fontSizeMargin = fontMargin;
        }
    }

    return self;
}

- (void)setTextColor:(UIColor *)textColor
{
    [super setTextColor:textColor];

    if (self.unitPriceType == UnitPriceTypeReferencePrice)
    {
        self.line.backgroundColor = textColor;
    }
}

- (void)setFont:(UIFont *)font
{
    [super setFont:font];

    if (self.fontSizeMargin > 0)
    {
        self.marginFontSize = fabs(self.font.pointSize - self.fontSizeMargin);
    }

    if (self.text)
    {
        NSString *string = nil;

        if ([self.text containsString:@"¥"])
        {
            NSRange rang = [self.text rangeOfString:@"¥"];
            string = [self.text substringFromIndex:rang.location + 1];
        }

        if ([string containsString:MatchLetter])
        {
            NSRange rang = [string rangeOfString:MatchLetter];
            string = [string substringToIndex:rang.location];
        }

        [self setText:string];
    }
}

- (void)setText:(NSString *)text
{
    //赋值的时候再设置
    if (nil == text)
    {
        return;
    }

    // 字体没有大小差异的时候
    if (self.fontSizeMargin <= 0)
    {
        [super setText:text];
        return;
    }

    CGFloat currentFontSize = self.font.pointSize;
    CGFloat marginFontSize = fabs(currentFontSize - self.fontSizeMargin);

    if (self.marginFontSize) //不设置这个的话字体会越来越小
    {
        marginFontSize = self.marginFontSize;
    }

    if (self.unitPriceType == UnitPriceTypeNormal)
    {

        NSString *allString = [NSString stringWithFormat:@"¥%@", [text moneyValue]];
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:allString];

        [self attStringWith:attStr fontSize:marginFontSize unitPriceType:UnitPriceTypeNormal];
        [attStr setAttributes:@{ NSForegroundColorAttributeName : [UIColor redColor] } range:NSMakeRange(0, attStr.length)];
    }
    else if (self.unitPriceType == UnitPriceTypeCurrentPrice) //现价
    {
        NSString *allString = [NSString stringWithFormat:@"¥%@%@", [text moneyValue], MatchLetter];
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:allString];

        [self attStringWith:attStr fontSize:marginFontSize unitPriceType:UnitPriceTypeCurrentPrice];
    }
    else if (self.unitPriceType == UnitPriceTypeTotalPrice) //总价
    {
        NSString *allString = [NSString stringWithFormat:@"合计:¥%@", [text moneyValue]];
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:allString];
        [self attStringWith:attStr fontSize:marginFontSize unitPriceType:UnitPriceTypeTotalPrice];
    }
    else //为参考价类型的时候
    {
        NSString *allString = [NSString stringWithFormat:@"¥%@/吨", [text moneyValue]];
        NSMutableAttributedString *attStr = [[NSMutableAttributedString alloc] initWithString:allString];
        self.attributedText = attStr;
    }
}

/**
 *  将字符串转成富文本
 *
 *  @param string   字符串
 *  @param fontSize 字体大小
 *  @param rang     设置属性的范围
 */
- (NSMutableAttributedString *)attributedStringWithAttributedString:(NSMutableAttributedString *)attStr fontSize:(CGFloat)fontSize range:(NSRange)rang
{
    if (attStr == nil)
    {
        return nil;
    }

    if (rang.length <= attStr.length && fontSize > 0)
    {
        [attStr setAttributes:@{ NSFontAttributeName : [UIFont systemFontOfSize:fontSize] } range:rang];

        return attStr;
    }
    return nil;
}

/**
 *  返回小数点后面的字符串
 *
 *  @param string 源字符串
 */
- (NSString *)afterPointString:(NSString *)string
{
    if (nil == string)
    {
        return nil;
    }

    if ([string containsString:@"."]) //是小数的时候
    {
        NSRange range = [string rangeOfString:@"."];
        NSString *subStr = [string substringFromIndex:range.location];

        return subStr;
    }

    return nil;
}

//根据条件判断设置属性
- (void)attStringWith:(NSMutableAttributedString *)attString fontSize:(CGFloat)marginFontSize unitPriceType:(UnitPriceType)unitPriceType
{
    NSString *string = attString.string;
    NSString *pointStr = [self afterPointString:string];

    NSRange rang = [string rangeOfString:@"."];
    NSRange letterRange = [string rangeOfString:@"¥"];

    if (pointStr) //有小数点存在
    {
        [self attributedStringWithAttributedString:attString fontSize:marginFontSize range:NSMakeRange(0, letterRange.location + letterRange.length)];
        [self attributedStringWithAttributedString:attString fontSize:marginFontSize range:NSMakeRange(rang.location, string.length - rang.location)];

        self.attributedText = attString;
    }
    else
    {
        [self attributedStringWithAttributedString:attString fontSize:marginFontSize range:NSMakeRange(0, letterRange.location + letterRange.length)];
        if (unitPriceType == UnitPriceTypeCurrentPrice)
        {
            [self attributedStringWithAttributedString:attString fontSize:marginFontSize range:NSMakeRange(string.length - 2, 2)];
        }
        self.attributedText = attString;
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    self.line.frame = CGRectMake(0, self.heightNormal * 0.5 - 0.5, self.widthNormal, 1);
}

@end
