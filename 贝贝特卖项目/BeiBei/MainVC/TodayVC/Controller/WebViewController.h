//
//  WebViewController.h
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <UIKit/UIKit.h>
//@class CustomTabBarController;
@interface WebViewController : UIViewController
@property (nonatomic,assign) NSInteger tag;
@property (nonatomic,copy) NSString *target;
//@property (nonatomic,strong) CustomTabBarController *tabBarVC;
@end
