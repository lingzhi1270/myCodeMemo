//
//  TodayViewController.m
//  BeiBei
//
//  Created by mac on 15-11-21.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "TodayViewController.h"
#import "UIBarButtonItem+LZ.h"
#import "MainCollectionViewCell.h"
#import "SecondCollectionViewCell.h"
#import "ThirdCollectionViewCell.h"
#import "Masonry.h"
#import "WebViewController.h"
#import "CustomTabBarController.h"
#import "RequestTool.h"
@interface TodayViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,webDelegate>{
    UIView *lineView;
    UIButton *lastBtn;
    NSArray *titleNameArr;
    
        NSMutableDictionary *dataDic;
        NSMutableArray *arr;
        NSDictionary *catBannarDic;
        NSDictionary *catShortcutsDic;
    
    NSMutableArray *babythingsArr;
    NSMutableArray *beautyArr;
    NSMutableArray *dressArr;
    NSMutableArray *foodArr;
    NSMutableArray *houseArr;
    NSMutableArray *shoesArr;
    NSMutableArray *toyArr;
    NSMutableArray *womanDressArr;
    
    NSMutableDictionary *allDataDic;
}
@property (nonatomic,strong) UIView *topCenterView;
@property (nonatomic,strong) UICollectionView *myCollectionView;
@property (nonatomic,strong) UIScrollView *MyScrollView;
@end

@implementation TodayViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
}
    return self;
}

#pragma mark -- 懒加载scrollView
- (UIScrollView *)MyScrollView
{
    if (_MyScrollView == nil) {
        _MyScrollView = [[UIScrollView alloc] init];
        _MyScrollView.tag = 100;
        _MyScrollView.contentSize = CGSizeMake(10 * 60, 30);
        _MyScrollView.backgroundColor = [UIColor clearColor];
        //默认为NO
        _MyScrollView.pagingEnabled = NO;
        //取消水平的指示线
        _MyScrollView.showsHorizontalScrollIndicator = NO;
        //设置划动边界范围
//        _MyScrollView.bounces = NO;
        
        titleNameArr = @[@"上新",@"童装",@"童鞋",@"用品",@"玩具",@"女装",@"居家",@"食品",@"美妆",@"下期预告"];
        for (int i = 0; i < 10; i ++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.tag = i + 1000;
           button.backgroundColor = [UIColor whiteColor];
            button.frame = CGRectMake(60 * i, 0, 60, 26);
            [button setFont:[UIFont systemFontOfSize:13]];
            [button setTitleColor:[UIColor colorWithRed:0.169 green:0.166 blue:0.166 alpha:1.000] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor colorWithRed:0.972 green:0.182 blue:0.320 alpha:1.000] forState:UIControlStateSelected];
            [button setTitle:titleNameArr[i] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            [_MyScrollView addSubview:button];
            if (button.tag == 1000) {
                lineView = [UIView new];
                lineView.backgroundColor = [UIColor colorWithRed:0.972 green:0.182 blue:0.320 alpha:1.000];
                lineView.center = CGPointMake(button.center.x, 27);
                NSString *btnTitle = titleNameArr[i];
                CGSize size = [btnTitle sizeWithFont:[UIFont systemFontOfSize:13]];
                lineView.bounds = CGRectMake(0, 0, size.width, 2);
                button.selected = YES;
                lastBtn = button;
                [_MyScrollView addSubview:lineView];
            }
        }
    }
    return _MyScrollView;
}

- (void)buttonClick:(UIButton *)sender
{
//    NSString *btnTitle = sender.titleLabel.text;
//    CGSize size = [btnTitle sizeWithFont:[UIFont systemFontOfSize:13]];
//    lastBtn.selected = NO;
//    sender.selected = YES;
//    lastBtn = sender;

   
//    CGFloat X = (sender.tag - 1000)*[self ScreenWith];
//    _myCollectionView.contentOffset = CGPointMake(X, 0);
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:sender.tag-1000 inSection:0];
    [_myCollectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:0.5];
//    lineView.center = CGPointMake(sender.center.x, 27);
//    lineView.bounds = CGRectMake(0, 0, size.width, 2);
//    [UIView commitAnimations];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if  (scrollView.tag == 200) {
//        LZLog(@"dsgdsgdhjh");
        UIButton *btn = (UIButton *)[self.view viewWithTag:scrollView.contentOffset.x / [self ScreenWith] +1000];
            NSString *btnTitle = btn.titleLabel.text;
           CGSize size = [btnTitle sizeWithFont:[UIFont systemFontOfSize:13]];
        lastBtn.selected = NO;
        btn.selected = YES;
        lastBtn = btn;
        
        CGFloat X = scrollView.contentOffset.x / 320 * 60 + 30.0;
       [UIView beginAnimations:nil context:nil];
       [UIView setAnimationDuration:0.2];
        lineView.center = CGPointMake(X, 27);
        lineView.bounds = CGRectMake(0, 0, size.width, 2);
        [UIView commitAnimations];
    }
}
#pragma mark--懒加载滑动条
- (UIView *)topCenterView
{
    if (_topCenterView == nil) {
        _topCenterView = [[UIView alloc] initWithFrame:CGRectMake(0, 5, 150, 54)];
        //添加图片  再渲染
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[[UIImage imageNamed:@"beibei_logo"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        imageView.frame = _topCenterView.bounds;
        [_topCenterView addSubview:imageView];
    }
    return _topCenterView;
}
#pragma mark--获取屏幕的宽度
- (CGFloat)ScreenWith
{
    CGRect rect = [UIScreen mainScreen].bounds;
     CGFloat ScreenWith = CGRectGetWidth(rect);
    return ScreenWith;
}
#pragma mark -- 懒加载collectionView
- (UICollectionView *)myCollectionView
{
    if (_myCollectionView == nil) {
        CGRect screen = [UIScreen mainScreen].bounds;
        CGFloat rectH = CGRectGetHeight(screen);
        CGFloat rectW = CGRectGetWidth(screen);
        CGRect rect = CGRectMake(0, 30, rectW, rectH-30-40);
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.itemSize = CGSizeMake(rectW, rectH-30-40);
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _myCollectionView = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:flowLayout];
        _myCollectionView.tag = 200;
        _myCollectionView.pagingEnabled = YES;
        _myCollectionView.showsHorizontalScrollIndicator = NO;
        _myCollectionView.showsVerticalScrollIndicator = NO;
        _myCollectionView.backgroundColor = [UIColor blueColor];
        //到边界不能滑动
        _myCollectionView.bounces = NO;
        //不用Xib要注册用 registerClass
        [_myCollectionView registerClass:[MainCollectionViewCell class] forCellWithReuseIdentifier:@"MainCollectionViewCell"];
        
        [_myCollectionView registerClass:[SecondCollectionViewCell class] forCellWithReuseIdentifier:@"SecondCollectionViewCell"];

        
        [_myCollectionView registerClass:[ThirdCollectionViewCell class] forCellWithReuseIdentifier:@"ThirdCollectionViewCell"];
        
        
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
       
    }
    return _myCollectionView;
    
}
#pragma mark--ViewWillAppear
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    ((CustomTabBarController *)self.tabBarController).downView.hidden = NO;

}
#pragma mark--ViewDidLoad
- (void)viewDidLoad
{
    [super viewDidLoad];
    
       //初始化数组和字典
    
    babythingsArr = [[NSMutableArray alloc] initWithCapacity:0];
    beautyArr = [[NSMutableArray alloc] initWithCapacity:0];
    dressArr = [[NSMutableArray alloc] initWithCapacity:0];
    foodArr = [[NSMutableArray alloc] initWithCapacity:0];
    houseArr = [[NSMutableArray alloc] initWithCapacity:0];
    shoesArr = [[NSMutableArray alloc] initWithCapacity:0];
    toyArr = [[NSMutableArray alloc] initWithCapacity:0];
    womanDressArr = [[NSMutableArray alloc] initWithCapacity:0];

    allDataDic = [[NSMutableDictionary alloc] init];
    
    arr = [[NSMutableArray alloc] initWithCapacity:0];
    catBannarDic = [[NSDictionary alloc] init];
    catShortcutsDic = [[NSDictionary alloc] init];
    dataDic = [[NSMutableDictionary alloc] init];
    
    //将导航的高度去掉  避免出现间隔！！！！
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    //隐藏navgationBar
//    self.navigationController.navigationBarHidden = YES;
    
    //导航的左右Btn   ic_default_main_right  ic_c2c_actbar_message
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithIcon:@"ic_c2c_actbar_message" target:self action:@selector(leftButtonClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithIcon:@"ic_default_main_right" target:self action:@selector(rightButtonClick)];
    
    //导航的titleView
    self.navigationItem.titleView = self.topCenterView;
    //加载ScrollView
    
    [self.view addSubview:self.MyScrollView];
    //给ScrollView添加约束
    [self.MyScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.height.offset(30);
    }];
       //加载collectionView
    [self.view addSubview:self.myCollectionView];
    [self.myCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(30);
        make.left.equalTo(self.view);
        make.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(40);
    }];
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    //  数据请求
    WS(weakSelf);
    [RequestTool todayOneRequestSuccess:^(id success) {
//        LZLog(@"=====%@",success);
        [arr removeAllObjects];
        [arr addObjectsFromArray:success];
        //刷新
        [weakSelf.myCollectionView reloadData];
        
    } faild:^(id faild) {
        
    }];
    
          [RequestTool dressRequestSuccess:^(id success) {
    
//              LZLog(@"===%@",success);
              [dressArr removeAllObjects];
              [dressArr addObjectsFromArray:success];
              //把数组放进字典中
              [allDataDic setObject:dressArr forKey:@"dress"];
          } faild:^(id faild) {
    
           }];
    
    [RequestTool shoesRequestSuccess:^(id success) {
        [shoesArr removeAllObjects];
        [shoesArr addObjectsFromArray:success];
        [allDataDic setObject:shoesArr forKey:@"shoes"];
        
    } faild:^(id faild) {
        
    }];
    
    [RequestTool babyRequestSuccess:^(id success) {
        [babythingsArr removeAllObjects];
        [babythingsArr addObjectsFromArray:success];
        [allDataDic setObject:babythingsArr forKey:@"babything"];
    } faild:^(id faild) {
        
    }];
    
    [RequestTool toyRequestSuccess:^(id success) {
        [toyArr removeAllObjects];
        [toyArr addObjectsFromArray:success];
        [allDataDic setObject:toyArr forKey:@"toy"];
        
    } faild:^(id faild) {
        
    }];
    
    [RequestTool womanDressRequestSuccess:^(id success) {
        [womanDressArr removeAllObjects];
        [womanDressArr addObjectsFromArray:success];
        [allDataDic setObject:womanDressArr forKey:@"woman_dress"];
    } faild:^(id faild) {
        
    }];
    
    [RequestTool houseRequestSuccess:^(id success) {
        [houseArr removeAllObjects];
        [houseArr addObjectsFromArray:success];
        [allDataDic setObject:houseArr forKey:@"house"];
    } faild:^(id faild) {
        
    }];

    [RequestTool foodRequestSuccess:^(id success) {
        [foodArr removeAllObjects];
        [foodArr addObjectsFromArray:success];
        [allDataDic setObject:foodArr forKey:@"food"];
        
    } faild:^(id faild) {
        
    }];
    
    [RequestTool beautyRequestSuccess:^(id success) {
        [beautyArr removeAllObjects];
        [beautyArr addObjectsFromArray:success];
        [allDataDic setObject:beautyArr forKey:@"beauty"];
    } faild:^(id faild) {
        
    }];
    
}
- (void)leftButtonClick
{
    LZLog(@"11111");
}

- (void)rightButtonClick
{
    LZLog(@"22222");
}

#pragma mark--UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return titleNameArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //for循环取字典
    for (int i = 0; i < arr.count; i ++) {
        dataDic = arr[i];
//                       LZLog(@"====%@",dataDic);
    }
    catBannarDic = dataDic[@"martshow_cat_banners"];
    catShortcutsDic = dataDic[@"martshow_cat_shortcuts"];
//    LZLog(@"=-=-=%@",catShortcutsDic);
    if (indexPath.item == 0) {
        MainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MainCollectionViewCell" forIndexPath:indexPath];
        //设置代理为self
        cell.myDelegate = self;
        return cell;
    }else if(indexPath.item == 9) {
        
        ThirdCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThirdCollectionViewCell" forIndexPath:indexPath];
        
        return cell;
    }else{
        
    SecondCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SecondCollectionViewCell" forIndexPath:indexPath];
        //传值
        cell.dic = catBannarDic;
        cell.shortDic = catShortcutsDic;
        cell.selectIndex = indexPath.item;
        cell.allDataDic = allDataDic;
    return cell;
        
    }
}
- (void)reloadWebViewWithBtnTag:(NSInteger)tag target:(NSString *)target
{
    //将值再传到webVC中
//    LZLog(@"=======%@--%d",target,tag);
    WebViewController *webVC = [[WebViewController alloc] init];
    webVC.target = target;
    webVC.tag = tag;
    
    [self.navigationController pushViewController:webVC animated:YES];
   
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
