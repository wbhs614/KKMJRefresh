//
//  KKRefresh.m
//  MJRefresh
//
//  Created by kkmac on 2017/3/13.
//  Copyright © 2017年 kkmac. All rights reserved.
//

#import "KKRefresh.h"

@implementation KKRefresh

+ (KKRefresh *)shareInstance
{
    static KKRefresh *refreshSharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        refreshSharedInstance = [[self alloc] init];
    });
    
    return refreshSharedInstance;
}

/**
 *  设置头部刷新
 *  @param tableView 当前控制器下面的tableView
 *  @param block 刷新回调block
 */
+(void)setHeaderWithTableView:(UITableView *)tableView  Target:(id)target refreshingBlaock:(HeaderRefreshingBlock)block {
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        block();
    }];
}

/**
 开始头部刷新
 @param tableView 当前刷新的tableView
 */
+(void)beginHeaderRefreshWithTableView:(UITableView *)tableView {
    [tableView.mj_header beginRefreshing];
}

/**
 结束头部刷新
 @param tableView 当前刷新的tableView
 */
+(void)endHeaderRefreshWithTableView:(UITableView *)tableView {
    [tableView.mj_header endRefreshing];
}

/**
 *  设置上拉加载更多
 *  @param tableView 当前控制器下面的tableView
 *  @param block 刷新回调block
 */
+(void)setFooterWithTableView:(UITableView *)tableView target:(id)target refreshingBlaock:(FooterRefreshingBlock)block {
    tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        block();
    }];
}

/**
 开始底部刷新
 @param tableView 当前刷新的tableView
 */
+(void)beginFooterRefreshWithTableView:(UITableView *)tableView {
    [tableView.mj_footer beginRefreshing];
}

/**
 结束底部刷新
 @param tableView 当前刷新的tableView
 */
+(void)endFooterRefreshWithTableView:(UITableView *)tableView {
    [tableView.mj_footer endRefreshing];
}

/**
 提示没有更多数据
 @param tableView 当前刷新的tableView
 */
+(void)endFooterRefreshingWithNoMoreData:(UITableView *)tableView {
    [tableView.mj_footer endRefreshingWithNoMoreData];
}

/**
 重新设置可以刷新状态
 @param tableView 当前刷新的tableView
 */
+(void)resetNoMoreData:(UITableView *)tableView {
    [tableView.mj_footer resetNoMoreData];
}

@end
