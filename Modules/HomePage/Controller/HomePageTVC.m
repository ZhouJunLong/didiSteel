//
//  HomePageTVC.m
//  嘀嘀拼钢zhou
//
//  Created by junlongZhou on 2018/1/22.
//  Copyright © 2018年 Mr.Zhou. All rights reserved.
//

#import "HomePageTVC.h"
#import "HomePageListTVCell.h"
#import "ApiHome.h"
@interface HomePageTVC ()
@property (nonatomic, strong) NSMutableArray *banner;
@property (nonatomic, strong) NSMutableArray *goodsItems;
@property (nonatomic, assign) int page;
@end

@implementation HomePageTVC

- (NSMutableArray *)goodsItems
{
    if (!_goodsItems)
    {
        _goodsItems = [NSMutableArray array];
    }
    
    return _goodsItems;
}

+ (void)load
{
    [ODYRouter registerClass:self key:@"homePageTVC"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNaviTitle:@"嘀嘀拼钢"];
    self.showBlankTips = YES;
    self.cellClass = [HomePageListTVCell class];
    self.banner = @[].mutableCopy;
    
    self.page = 1;
    [self updateBanner];
    [self updateGoodsListWithPage:self.page];
    
    [self setupMJHeader:self.tableView isShowIamges:NO];
    [self setupMJFooter:self.tableView isShowIamges:NO];
}
- (void)updateBanner
{
//    [self showLoading];

    [ApiHome queryGrouponForecastList:^(DataSilentLoader *silentLoader, DataResult *result) {
        NSLog(@"result--Banner--%@",result);

//        [self hideLoading];
        if ([DataResult hasError:result])
        {
            return;
        }
        
        self.banner = [result.items getMutableArray];
        [self merge];
    }];
}
- (void)updateGoodsListWithPage:(int)page
{
    NSMutableDictionary *param = [NSMutableDictionary dictionary];
    
    int pageon = 1;
    if (page)
    {
        pageon = page;
    }
    
    [param setInt:20 forKey:@"pagesize"];
    [param setInt:pageon forKey:@"pageno"];
    
    [ApiHome searchWith:param
       MerchantProducts:^(DataSilentLoader *silentLoader, DataResult *result) {
           if ([DataResult hasError:result])
           {
               if (pageon == 1)
               {
                   [self.tableView.mj_header endRefreshing];
               }
               else
               {
                   [self.tableView.mj_footer endRefreshing];
               }
               
               return;
           }
           
           if (pageon == 1)
           {
               self.tableView.mj_footer.hidden = !result.items.count;
               
               [self.goodsItems removeAllObjects];
               [self.tableView.mj_header endRefreshing];
           }
           else
           {
               [self.tableView.mj_footer endRefreshing];
           }
           
           [self preprocess:[result.items getMutableArray]];
       }];
}
- (void)preprocess:(NSMutableArray *)array{
    for (int i = 0; i < [array count]; i++) {
        NSMutableDictionary *item = [array getMutableDict:i];
        [item setInt:(int)UIRectCornerAllCorners forKey:CKCornerType];
        [item setDouble:10 forKey:CKFooterHeight];
    }
    [self.goodsItems append:array];
    [[self.goodsItems getMutableDict:0] setDouble:10 forKey:CKHeaderHeight];
     [self merge];
}
- (void)merge{
    NSMutableArray *array =self.goodsItems.getMutableArray;
    [array insertObject:@{CKCellClass:[CycleImageCell class],CKHeaderHeight:@(0.001),CKRowHeight:@(0.625*ScreenWidth),CKValue: self.banner} atIndex:0];
    self.items = [array getMutableArray];
  
}

/**
 下拉刷新
 */
- (void)pullUpRefresh{
    if ([HJReachability isConnectedToNetWork]) {
        self.page = 1;
        [self.tableView.mj_footer resetNoMoreData];
        [self updateGoodsListWithPage:1];
        [self updateBanner];
    }else{
        [self.tableView.mj_header endRefreshing];
    }
}

/**
 上拉加载
 */
- (void)footerLoad{
    if ([HJReachability isConnectedToNetWork]) {
        if (self.goodsItems.count == 0 || self.goodsItems.count < 20*self.page) {
            [self.tableView.mj_footer endRefreshingWithNoMoreData];
        }else{
            self.page++;
            [self updateGoodsListWithPage:self.page];
        }
    }else{
         [self.tableView.mj_footer endRefreshing];
    }
}
#pragma mark - 空白提示需要的代理函数

// 图标文件名。
- (NSString *)blankTipsIcon
{
    return @"no_-invoice";
}

// 提示标题。
- (NSString *)blankTipsTitle
{
    return @"哎呀，没有拉到数据，刷新下试试～";
}

// 提示内容。
- (NSString *)blankTipsContent
{
    return nil;
}

// 下一步行动名称。
- (NSString *)blankTipsNextAction
{
    return @"刷新";
}

- (void)nextActionAfterBlank
{
    [self updateBanner];
    [self updateGoodsListWithPage:1];
}

@end
