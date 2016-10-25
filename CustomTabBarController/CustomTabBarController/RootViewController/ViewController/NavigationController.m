//
//  NavigationController.m
//  XinHuaAgecy
//
//  Created by soar on 15/10/13.
//  Copyright (c) 2015年 www.soarmobile.com.cn. All rights reserved.
//

#define MAINRGB [UIColor colorWithRed:18/255.0f green:183/255.0f blue:245/255.0f alpha:(1)]


#import "NavigationController.h"

@interface NavigationController ()

@end

@implementation NavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    //设置导航栏背景颜色
//    self.navigationBar.translucent = NO;
    [[UINavigationBar appearance] setBarTintColor:MAINRGB];
    
    //设置导航栏字体颜色
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18]};
    
    //设置状态栏字体颜色
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    //导航栏
    UIButton *setBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    setBtn.frame = CGRectMake(0, 0, 10, 19);
    [setBtn setBackgroundImage:[UIImage imageNamed:@"fanhui"] forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(popToBack) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:setBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)])
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
    
}

- (void)popToBack
{
    [self popViewControllerAnimated:YES];
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
    
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    return [super popViewControllerAnimated:animated];
}

@end
