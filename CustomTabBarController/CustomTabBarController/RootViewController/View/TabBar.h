//
//  TabBar.h
//  XinHuaAgecy
//
//  Created by soar on 15/10/13.
//  Copyright (c) 2015年 www.soarmobile.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TabBarButton.h"

typedef void (^Block)(NSInteger integer);

@interface TabBar : UIView

@property (nonatomic,strong)NSArray *controllers;

@property (nonatomic, copy) NSArray <TabBarButton *> *items;

@property (nonatomic,copy)Block block;

@end
