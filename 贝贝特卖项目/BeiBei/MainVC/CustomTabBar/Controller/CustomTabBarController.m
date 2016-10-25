//
//  CustomTabBarController.m
//  BeiBei
//
//  Created by mac on 15-11-20.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "CustomTabBarController.h"
#import "TodayViewController.h"
#import "OverseasViewController.h"
#import "CircleViewController.h"
#import "ShopViewController.h"
#import "MyViewController.h"
#import "CustomBtn.h"
#import "Masonry.h"
@interface CustomTabBarController (){
    CustomBtn *lastBtn;
    
    CustomBtn *myBtn;
    
}
@end

@implementation CustomTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
      
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    //隐藏系统的TabBar
    self.tabBar.hidden = YES;
    [self setChildViewContoller];
}
#pragma mark---布局
- (void)createNav:(Class)class
{
    UIViewController *vc = [class new];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}
- (void)setChildViewContoller
{
    //创建五个 子视图
    [self createNav:[TodayViewController class]];
    [self createNav:[OverseasViewController class]];
    [self createNav:[CircleViewController class]];
    [self createNav:[ShopViewController class]];
    [self createNav:[MyViewController class]];
    
    self.downView = [UIView new];
    self.downView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.downView];
    
    NSArray *imageArray = @[@"ic_tabbar_home_gray",@"ic_tabbar_home",@"ic_tabbar_oversea_gray",@"ic_tabbar_oversea_red",@"ic_c2c_tab_weigou",@"ic_c2c_tab_weigou_selected",@"ic_tabbar_shopping_cart_gray",@"ic_tabbar_shopping_cart",@"ic_tabbar_my_gray",@"ic_tabbar_my"];
    NSArray *nameArray = @[@"今日特卖",@"海外购",@"圈儿",@"购物车",@"我的",];
    
    for (int i = 0; i < self.viewControllers.count; i ++) {
        CustomBtn *button = [CustomBtn buttonWithType:UIButtonTypeCustom];
        button.tag = i + 1000;
        //设置button图片的Mode 横屏的时候图片大小不变
        button.imageView.contentMode = UIViewContentModeScaleAspectFit;
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        //设置图片
        button.highlighted = NO;
        [button setImage:[UIImage imageNamed:imageArray[i*2]] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:imageArray[i*2+1]] forState:UIControlStateSelected];
        [button setImage:[UIImage imageNamed:imageArray[i*2+1]] forState:UIControlStateHighlighted];
        //设置tabBaritem的名字及颜色
        [button setTitle:nameArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithRed:0.972 green:0.182 blue:0.320 alpha:1.000] forState:UIControlStateSelected];
        [button setTitleColor:[UIColor colorWithRed:0.972 green:0.182 blue:0.320 alpha:1.000] forState:UIControlStateHighlighted];
        [button setFont:[UIFont systemFontOfSize:12]];
        
        button.adjustsImageWhenHighlighted = NO;
       
        [self.downView addSubview:button];
        if (button.tag == 1000) {
            [button setImage:[UIImage imageNamed:imageArray[i*2+1]] forState:UIControlStateSelected];
            [button setTitleColor:[UIColor colorWithRed:0.972 green:0.182 blue:0.320 alpha:1.000] forState:UIControlStateSelected];
            button.selected = YES;
            lastBtn = button;
            //约束
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.offset(0);
                make.top.offset(0);
                make.bottom.offset(0);
                make.width.equalTo(self.downView.mas_width).multipliedBy(0.2);
                
            }];
            myBtn = button;
         }else if(button.tag == 1001){
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(myBtn.mas_right).offset(0);
               
                make.top.offset(0);
                make.bottom.offset(0);
                make.width.equalTo(myBtn.mas_width);
            }];
             myBtn = button;
         }else if(button.tag == 1002){
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(myBtn.mas_right).offset(0);
                make.top.offset(0);
                make.bottom.offset(0);
                make.width.equalTo(myBtn.mas_width);
            }];
             myBtn = button;
         }else if(button.tag == 1003){
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(myBtn.mas_right).offset(0);
               
                make.top.offset(0);
                make.bottom.offset(0);
                 make.width.equalTo(myBtn.mas_width);
            }];
             myBtn = button;
        }else if (button.tag == 1004){
            [button mas_makeConstraints:^(MASConstraintMaker *make) {
                //不需要设置右边！！！三个约束已经固定
                make.left.equalTo(myBtn.mas_right).offset(0);
                make.top.offset(0);
                make.bottom.offset(0);
                make.width.equalTo(myBtn.mas_width);
            }];
        }
}
#pragma mark--约束
    [self.downView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.bottom.offset(0);
        //定高度40
        make.height.offset(40);
    }];
}
- (void)buttonClick:(CustomBtn *)sender
{
    UIImage *selectedImage = [sender imageForState:UIControlStateSelected];
    [sender setImage:selectedImage forState:UIControlStateHighlighted|UIControlStateSelected];
    [sender setTitleColor:[UIColor colorWithRed:0.972 green:0.182 blue:0.320 alpha:1.000] forState:UIControlStateSelected|UIControlStateHighlighted];
    lastBtn.selected = NO;
    sender.selected = YES;
    lastBtn = sender;
    //切换视图控制器
    self.selectedIndex = sender.tag - 1000;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}
@end
