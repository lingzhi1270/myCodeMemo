//
//  MyViewController.m
//  BeiBei
//
//  Created by mac on 15-11-21.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "MyViewController.h"
#import "MJRefresh.h"
#import "UIBarButtonItem+LZ.h"
@interface MyViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong) UITableView *myTableView;
@end

@implementation MyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (UITableView *)myTableView
{
    if (_myTableView == nil) {
        
        CGRect rect = [UIScreen mainScreen].bounds;
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(rect), CGRectGetHeight(rect)) style:UITableViewStyleGrouped];
        
        [_myTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        
        _myTableView.delegate = self;
        _myTableView.dataSource = self;
    }
    return _myTableView;
    
}
#pragma mark--UITableViewDataSource,UITableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 6;
    }else{
        return 2;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    WS(weakSelf);
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        LZLog(@"正在刷新");
    
        [self.myTableView.mj_header endRefreshing];
    }];
    
    [self.myTableView.mj_header beginRefreshing];
    
    self.myTableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
        LZLog(@"下拉刷新");
    }];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor yellowColor];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.972 green:0.182 blue:0.320 alpha:1.000];
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"ic_c2c_actbar_message" target:self action:@selector(leftButtonClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"ic_actbar_setting" target:self action:@selector(rightButtonClick)];
    
    UIView *headView = [UIView new];
    headView.frame = CGRectMake(0, 0, 0, 100);
    headView.backgroundColor = [UIColor colorWithRed:0.972 green:0.182 blue:0.320 alpha:1.000];

    
    self.myTableView.tableHeaderView = headView;

    [self.view addSubview:self.myTableView];
}
- (void)leftButtonClick{
    LZLog(@"3333");
}
- (void)rightButtonClick
{
    LZLog(@"44444");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
