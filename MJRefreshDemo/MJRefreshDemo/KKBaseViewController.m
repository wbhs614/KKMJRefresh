//
//  KKBaseViewController.m
//  MJRefreshDemo
//
//  Created by kkmac on 2017/3/11.
//  Copyright © 2017年 kkmac. All rights reserved.
//

#import "KKBaseViewController.h"

@interface KKBaseViewController ()

@end

@implementation KKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark---上拉加载和下拉刷新的方法
/**
 *  设置头部刷新
 *  @param tableView 当前控制器下面的tableView
 *  @param block 刷新回调block
 */
-(void)setHeaderWithTableView:(UITableView *)tableView  refreshingBlaock:(HeaderRefreshingBlock )block {
    _headerRefreshingBlock=block;
    tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(onMJHeaderRefresh:)];
}

/**
 开始刷新
 @param tableView 当前刷新的tableView
 */
-(void)beginHeaderRefreshWithTableView:(UITableView *)tableView {
    [tableView.mj_header beginRefreshing];
}

/**
 结束刷新
 @param tableView 当前刷新的tableView
 */
-(void)endHeaderRefreshWithTableView:(UITableView *)tableView {
    [tableView.mj_header endRefreshing];
}

/*下拉刷新事件*/
-(void)onMJHeaderRefresh:(id)sender{
    if (_headerRefreshingBlock) {
        _headerRefreshingBlock();
    }
}

/**
 *  设置上拉加载更多
 *  @param tableView 当前控制器下面的tableView
 *  @param block 刷新回调block
 */
-(void)setFooterWithTableView:(UITableView *)tableView refreshingBlaock:(FooterRefreshingBlock)block {
    _FooterRefreshingBlock=block;
    tableView.mj_footer=[MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(onMJFooterRefresh:)];
    
}


/**
 开始底部刷新
 @param tableView 当前刷新的tableView
 */
-(void)beginFooterRefreshWithTableView:(UITableView *)tableView {
    [tableView.mj_footer beginRefreshing];
}

/**
 结束底部刷新
 @param tableView 当前刷新的tableView
 */
-(void)endFooterRefreshWithTableView:(UITableView *)tableView {
    [tableView.mj_footer endRefreshing];
}

/*上拉加载更多事件*/
-(void)onMJFooterRefresh:(id)sender {
    if (_FooterRefreshingBlock) {
        _FooterRefreshingBlock();
    }
}

/**
 提示没有更多数据
 @param tableView 当前刷新的tableView
 */
-(void)endFooterRefreshingWithNoMoreData:(UITableView *)tableView {
    [tableView.mj_footer endRefreshingWithNoMoreData];
}

/**
 重新设置可以刷新状态
 @param tableView 当前刷新的tableView
 */
-(void)resetNoMoreData:(UITableView *)tableView {
    [tableView.mj_footer resetNoMoreData];
}
@end
