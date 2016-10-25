//
//  TFTabBarViewController.m
//  CustomTabBarController
//
//  Created by TF_man on 16/9/2.
//  Copyright © 2016年 TF_man. All rights reserved.
//

#import "TFTabBarViewController.h"

#import "NavigationController.h"
#import "TabBar.h"

#import "OneViewController.h"
#import "TowViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface TFTabBarViewController ()

@property (nonatomic, strong) TabBar *customTabBar;

@end

@implementation TFTabBarViewController

//view将要消失，调用该方法
- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];

    if (!_customTabBar) {

        for (UIView *view in self.tabBar.subviews) {

            [view removeFromSuperview];
        }

        __weak typeof (self) weakSelf = self;
        
        for (UIView *view in self.tabBar.subviews) {
            [view removeFromSuperview];
        }
        _customTabBar = [[TabBar alloc] initWithFrame:self.tabBar.bounds];

        _customTabBar.controllers = self.childViewControllers;

        TabBarButton *tabBtn = [self.customTabBar.items objectAtIndex:0];
        tabBtn.badgeStyle = TabItemBadgeStyleNumber;
        tabBtn.badge = 9;
        
        TabBarButton *tabBtn1 = [self.customTabBar.items objectAtIndex:1];
        tabBtn1.badgeStyle = TabItemBadgeStyleNumber;
        tabBtn1.badge = 999;
        
        TabBarButton *tabBtn2 = [self.customTabBar.items objectAtIndex:2];
        tabBtn2.badgeStyle = TabItemBadgeStyleNumber;
        tabBtn2.badge = 66;
        
        TabBarButton *tabBtn3 = [self.customTabBar.items objectAtIndex:3];
        tabBtn3.badgeStyle = TabItemBadgeStyleDot;

        _customTabBar.block = ^(NSInteger integer){
            weakSelf.selectedIndex = integer;
        };
        [self.tabBar addSubview:_customTabBar];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupControllersWithClass:[OneViewController class] title:@"one" image:@"tab_discover_normal" seletedImage:@"tab_discover_selected" NibName:nil];
    [self setupControllersWithClass:[TowViewController class] title:@"Two" image:@"tab_me_normal" seletedImage:@"tab_me_selected" NibName:nil];
    
    [self setupControllersWithClass:[ThreeViewController class] title:@"three" image:@"tab_me_normal" seletedImage:@"tab_me_selected" NibName:nil];
    
    
    [self setupControllersWithClass:[FourViewController class] title:@"Four" image:@"tab_me_normal" seletedImage:@"tab_me_selected" NibName:nil];
    
}

//设置标签控制器上内容
- (void)setupControllersWithClass:(Class)class title:(NSString *)title image:(NSString*)imageStr seletedImage:(NSString *)selectedImage NibName:(NSString *)name{
    
    //创建子导航控制器、Controller控制器
    UIViewController *vc = [[class alloc] initWithNibName:name bundle:nil];
    NavigationController *na = [[NavigationController alloc]initWithRootViewController:vc];
    vc.navigationItem.title = title;
    na.tabBarItem.title = title;
    na.tabBarItem.image = [[UIImage imageNamed:imageStr]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    na.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:na];
}




@end
