//
//  WebViewController.m
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "WebViewController.h"
#import "CustomTabBarController.h"
@interface WebViewController ()

@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//- (CustomTabBarController *)tabBarVC
//{
//    if (_tabBarVC == nil) {
//        _tabBarVC = [CustomTabBarController new];
//        _tabBarVC = (CustomTabBarController *)self.tabBarController;
//    }
//    return _tabBarVC;
//    
//}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    //1.直接用系统的  需要强转类型    tabBarController是系统的要转换成CustomTabBarController
      ((CustomTabBarController *)self.tabBarController).downView.hidden = YES;
    //2.将系统的tabBarController赋值给tabBarVC
//    self.tabBarVC.downView.hidden = YES;
//    self.tabBarController.tabBar.frame = CGRectMake(0, CGRectGetHeight(self.view.frame), 0, 0);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:webView];

    NSURL *url = [NSURL URLWithString:self.target];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
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
