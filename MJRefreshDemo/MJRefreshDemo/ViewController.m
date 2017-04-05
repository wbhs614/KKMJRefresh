//
//  ViewController.m
//  MJRefreshDemo
//
//  Created by kkmac on 2017/3/11.
//  Copyright © 2017年 kkmac. All rights reserved.
//

#import "ViewController.h"
#import "KKRefresh.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *mainView;
@property (nonatomic,strong) NSMutableArray *viewModel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    __weak ViewController *weakSelf=self;
    [self loadData];
    [KKRefresh setHeaderWithTableView:self.mainView Target:self refreshingBlaock:^{
        [weakSelf onDropDown];
    }];
    [KKRefresh setFooterWithTableView:self.mainView target:self refreshingBlaock:^{
        [weakSelf onPullUp];
    }];
    
}

/*上拉加载更多的方法*/
-(void)onPullUp {
    [self loadData];
    [self.mainView reloadData];
}

/*下拉刷新的方法*/
-(void)onDropDown {
    self.viewModel=nil;
    [self loadData];
    [self.mainView reloadData];
}
-(NSMutableArray *)viewModel {
    if (!_viewModel) {
        _viewModel=[NSMutableArray arrayWithCapacity:10];
    }
    return _viewModel;
}

-(void)loadData {
    
    for (int i=0; i<10; i++) {
        NSDictionary *dict=i%2?[NSDictionary dictionaryWithObjects:@[@"王五",@"奇数"] forKeys:@[@"name",@"type"]]:[NSDictionary dictionaryWithObjects:@[@"钱六",@"偶数"] forKeys:@[@"name",@"type"]];
        [self.viewModel addObject:dict];
        if (i%9==0) {
            [KKRefresh endHeaderRefreshWithTableView:self.mainView];
            [KKRefresh endFooterRefreshWithTableView:self.mainView];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark---UITableViewDelegate代理
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"MJDemoCell"];
    UILabel *nameLabel=[cell.contentView viewWithTag:1];
    UILabel *tyepLabel=[cell.contentView viewWithTag:2];
    NSDictionary *dict=_viewModel[indexPath.row];
    NSString *name=[dict objectForKey:@"name"];
    NSString *type=[dict objectForKey:@"type"];
    nameLabel.text=name;
    tyepLabel.text=type;
    return cell;
    
}


@end
