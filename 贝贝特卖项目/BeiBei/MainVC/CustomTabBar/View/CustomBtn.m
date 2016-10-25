//
//  CustomBtn.m
//  BeiBei
//
//  Created by mac on 15-11-21.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "CustomBtn.h"

@implementation CustomBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        //设置title居中
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return self;
}
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageW = CGRectGetWidth(self.bounds);
    return CGRectMake(15, 2, imageW-30, 23);
}
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleW = CGRectGetWidth(self.bounds);
    return CGRectMake(0, 25, titleW, 15);
}
@end
