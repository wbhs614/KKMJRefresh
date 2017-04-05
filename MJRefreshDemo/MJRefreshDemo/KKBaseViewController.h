//
//  KKBaseViewController.h
//  MJRefreshDemo
//
//  Created by kkmac on 2017/3/11.
//  Copyright © 2017年 kkmac. All rights reserved.
//

/**
 控制器基础类
 创建时间：2017-3-11
 作用：作为所有控制器的原始基类
 */
#import <UIKit/UIKit.h>
#import "MJRefresh.h"
/*定义下拉刷新的block*/
typedef void(^HeaderRefreshingBlock)();
/*定义上拉加载更多的block*/
typedef void(^FooterRefreshingBlock)();


@interface KKBaseViewController : UIViewController
/*下拉刷新的bock*/
@property (nonatomic,strong)HeaderRefreshingBlock headerRefreshingBlock;
/*上拉加载的bock*/
@property (nonatomic,strong)FooterRefreshingBlock FooterRefreshingBlock;

/**
 *  设置头部刷新
 *  @param tableView 当前控制器下面的tableView
 *  @param block 刷新回调block
 */
-(void)setHeaderWithTableView:(UITableView *)tableView  refreshingBlaock:(HeaderRefreshingBlock)block;

/**
 开始头部刷新
 @param tableView 当前刷新的tableView
 */
-(void)beginHeaderRefreshWithTableView:(UITableView *)tableView;

/**
 结束头部刷新
 @param tableView 当前刷新的tableView
 */
-(void)endHeaderRefreshWithTableView:(UITableView *)tableView;

/**
 *  设置上拉加载更多
 *  @param tableView 当前控制器下面的tableView
 *  @param block 刷新回调block
 */
-(void)setFooterWithTableView:(UITableView *)tableView refreshingBlaock:(FooterRefreshingBlock)block;

/**
 开始底部刷新
 @param tableView 当前刷新的tableView
 */
-(void)beginFooterRefreshWithTableView:(UITableView *)tableView;

/**
 结束底部刷新
 @param tableView 当前刷新的tableView
 */
-(void)endFooterRefreshWithTableView:(UITableView *)tableView;

/**
 提示没有更多数据
 @param tableView 当前刷新的tableView
 */
-(void)endFooterRefreshingWithNoMoreData:(UITableView *)tableView;

/**
 重新设置可以刷新状态
 @param tableView 当前刷新的tableView
 */
-(void)resetNoMoreData:(UITableView *)tableView;
@end
