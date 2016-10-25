//
//  TabBarButton.h
//  XinHuaAgecy
//
//  Created by soar on 15/10/13.
//  Copyright (c) 2015年 www.soarmobile.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, TabItemBadgeStyle) {
    
    TabItemBadgeStyleNone = 0,
    TabItemBadgeStyleNumber = 1, // 数字样式
    TabItemBadgeStyleDot = 2, // 小圆点
};

@interface TabBarButton : UIButton

@property (nonatomic, assign) TabItemBadgeStyle badgeStyle;

@property (nonatomic, assign) NSInteger badge;

@property (nonatomic,assign)BOOL isHideBadgeBtn;


@end
