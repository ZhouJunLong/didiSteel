//
//  PhoneTBC.m
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/1/22.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "PhoneTBC.h"
//view
#import "BaseTabBar.h"
#import "PhoneTabBarItem.h"
@interface PhoneTBC ()

@end

@implementation PhoneTBC

-(NSInteger)homeIndex{
    return 0;
}

- (NSArray *)tabBarItems{
     PhoneTabBarItem *homeItemVO = [PhoneTabBarItem new];
    homeItemVO.title = @"首页";
    homeItemVO.image = [UIImage imageNamed:@"home"];
    homeItemVO.selectedImage = [UIImage imageNamed:@"home_selected"];
    
    PhoneTabBarItem *nearItemVO = [PhoneTabBarItem new];
    nearItemVO.title = @"超市";
    nearItemVO.image = [UIImage imageNamed:@"supermarket_1"];
    nearItemVO.selectedImage = [UIImage imageNamed:@"supermarket_2"];
    
    PhoneTabBarItem *serviceItemVO = [PhoneTabBarItem new];
    serviceItemVO.title = @"购物车";
    serviceItemVO.image = [UIImage imageNamed:@"shopping_cart_1"];
    serviceItemVO.selectedImage = [UIImage imageNamed:@"shopping_cart_2"];
    
    PhoneTabBarItem *mineItemVO = [PhoneTabBarItem new];
    mineItemVO.title = @"我";
    mineItemVO.image = [UIImage imageNamed:@"me"];
    mineItemVO.selectedImage = [UIImage imageNamed:@"me_selected"];
    
    return @[ homeItemVO, nearItemVO, serviceItemVO, mineItemVO ];
}
-(NSArray<UIViewController *> *)viewControllers{
    PhoneVC *vc1 = [NSClassFromString(@"HomePageTVC") new];
    BaseNC *nc1 = [[BaseNC alloc] initWithRootViewController:vc1 enableInteractivePush:YES];
    
    [ODYGlobalValue sharedInstance].tabDefaultNC = nc1;
    [ODYGlobalValue sharedInstance].homeNC = nc1;
    
    PhoneVC *vc2 = [NSClassFromString(@"SearchBaseVC") new];
    BaseNC *nc2 = [[BaseNC alloc] initWithRootViewController:vc2 enableInteractivePush:YES];
    
    PhoneVC *vc3 = [NSClassFromString(@"ShoppingCartVC") new];
    BaseNC *nc3 = [[BaseNC alloc] initWithRootViewController:vc3 enableInteractivePush:YES];
    
    PhoneVC *vc4 = [NSClassFromString(@"MineVC") new];
    BaseNC *nc4 = [[BaseNC alloc] initWithRootViewController:vc4 enableInteractivePush:YES];
    
    return @[ nc1, nc2, nc3, nc4 ];
}
#pragma mark - BaseTabBarDelegate
- (void)customTabBar:(BaseTabBar *)tabBar didSelectItem:(BaseTabBarItem *)item{
     [super enterTabWithItem:item];
}



@end
