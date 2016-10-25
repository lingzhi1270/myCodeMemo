//
//  TabBar.m
//  XinHuaAgecy
//
//  Created by soar on 15/10/13.
//  Copyright (c) 2015年 www.soarmobile.com.cn. All rights reserved.
//

//RGB
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)]

#import "TabBar.h"

@interface TabBar()

@property (nonatomic,weak)UIButton *selecteBtn;

@end


@implementation TabBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        

    }
    return self;
}


- (void)setControllers:(NSArray *)controllers{
    
    _controllers = controllers;

    CGFloat viewW = self.frame.size.width/controllers.count;
    NSMutableArray *items = [NSMutableArray array];
    for (int i = 0; i < _controllers.count; i++) {
        
        UIViewController *vc = _controllers[i];
        TabBarButton *btn = [[TabBarButton alloc]initWithFrame:CGRectMake(viewW *i, 0, viewW, 49)];
        btn.tag = 100+i;
        //设置图片
        [btn setImage:vc.tabBarItem.image forState:UIControlStateNormal];
        [btn setImage:vc.tabBarItem.selectedImage forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        //设置字体的颜色
        [btn setTitle:vc.tabBarItem.title forState:UIControlStateNormal];
        [btn setTitleColor:RGBA(38, 38, 38, 1) forState:UIControlStateNormal];
        [btn setTitleColor:RGBA(51, 153, 255, 1) forState:UIControlStateSelected];

        if (btn.tag == 100) {
            
            btn.selected = YES;
            self.selecteBtn = btn;
        }
        [self addSubview:btn];
        [items addObject:btn];
    }
    
    self.items = items;
    
}

- (void)btnClick:(UIButton *)btn{
    
    if (!btn.selected) {
        btn.selected = YES;
        self.selecteBtn.selected = NO;
        self.selecteBtn = btn;
    }
    self.block(btn.tag - 100);

    if (_block) {
        self.block(btn.tag - 100);
    }
}



@end
