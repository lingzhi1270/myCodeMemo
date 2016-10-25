//
//  CustomOneCell.m
//  BeiBei
//
//  Created by mac on 15-11-24.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "CustomOneCell.h"
#import "Masonry.h"
@implementation CustomOneCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.mybtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.mybtn.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.mybtn];
        [self.mybtn mas_makeConstraints:^(MASConstraintMaker *make) {
               make.top.offset(0);
               make.bottom.offset(0);
               make.left.offset(0);
               make.right.offset(0);
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
