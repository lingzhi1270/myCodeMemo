//
//  MyButton.m
//  BeiBei
//
//  Created by mac on 15-11-23.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "MyButton.h"

@implementation MyButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //字居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        //button的title字体颜色
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    return self;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
   CGFloat imageW = CGRectGetWidth(self.bounds);
    return CGRectMake(10, 5, imageW-20, 35);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = CGRectGetWidth(self.bounds);
    return CGRectMake(0, 38, titleW, 20);
}

@end
