//
//  MasterViewController.m
//  HorizontalAnimationDemo
//
//  Created by 袁斌 on 16/5/14.
//  Copyright © 2016年 https://github.com/DefaultYuan/CustomTakePhotoAndCollectionViewAnimation. All rights reserved.
//

#import "MasterViewController.h"
#import "HAMainAnimationView.h"
#import "HACollectionContanst.h"
@interface MasterViewController ()<HAMainAnimationViewDelegate>

@property (nonatomic, strong) NSMutableArray *dataArr;
@property (nonatomic, strong) UIView *selectedImageView;
@property (nonatomic, strong) HAMainAnimationView *mainView;

@end

@implementation MasterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(kMainWidth * 0.5 - 50, 100, 100, 50);
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"show" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(showAnimation) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    [self.view addSubview:self.selectedImageView];
    [self.selectedImageView setHidden:YES];
    

}
- (void)showAnimation
{
    [self.view addSubview:self.mainView];
    [self.mainView showInSuperView:self.view];
}
#pragma mark HAMainAnimationViewDelegate
-(void)didSeletedHAMainAnimationViewItem:(HACollectItem *)item
{
    [self didCloseHAMainAnimationView];
    NSLog(@"选中了%@",item.title);
    [self.selectedImageView setHidden:NO];
//    [self.selectedImageView setImage:[UIImage imageNamed:item.img]];
    UIImage *selImg =  [UIImage imageNamed:item.img];
    self.selectedImageView.layer.contents = (__bridge id)selImg.CGImage;
    self.selectedImageView.layer.contentsScale = [UIScreen mainScreen].scale;
    self.selectedImageView.layer.contentsRect = CGRectMake(0, 0, .5, .5);
}

- (void)didCloseHAMainAnimationView
{
    [self.mainView removeFromSuperview];
}
#pragma mark addsubviews
- (HAMainAnimationView *)mainView
{
    if (!_mainView) {
        _mainView = [[HAMainAnimationView alloc] initWithFrame:CGRectMake(0, 0, kMainWidth, kMainHeight)];
        _mainView.dataArray = self.dataArr;
        _mainView.delegate = self;
    }
    return _mainView;
}
-(UIView *)selectedImageView
{
    if (!_selectedImageView) {
        _selectedImageView = [[UIView alloc] initWithFrame:CGRectMake(kMainWidth * 0.5 - 100, 200, 200, 200)];
        _selectedImageView.layer.contentsGravity = kCAGravityResizeAspect;
    }
    return _selectedImageView;
}
#pragma mark init data
-(NSMutableArray *)dataArr
{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
        for (int i=0; i < 9; i++) {
            HACollectItem *item = [[HACollectItem alloc] init];
            item.img = [NSString stringWithFormat:@"%d.jpg",i];
            item.title = [NSString stringWithFormat:@"第%d张图片",i + 1];
            [_dataArr addObject:item];
        }
    }
    return _dataArr;
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
