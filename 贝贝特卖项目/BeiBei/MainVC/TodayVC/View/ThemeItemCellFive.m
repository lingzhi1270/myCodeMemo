//
//  ThemeItemCellFive.m
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "ThemeItemCellFive.h"
#import "Masonry.h"
@implementation ThemeItemCellFive
//没约束
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(0);
            make.right.offset(0);
            make.height.offset(130);
        }];
        
        self.priceLabel = [UILabel new];
        self.priceLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.bottom.offset(0);
            make.width.offset(240);
            make.height.offset(12);
        }];

        WS(weakSelf);
        self.nameLabel = [UILabel new];
        self.nameLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.bottom.equalTo(weakSelf.priceLabel.mas_top).offset(0);
            make.width.offset(240);
            make.height.offset(18);
        }];

        self.timeLabel = [UILabel new];
        self.timeLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.timeLabel];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(0);
            make.width.offset(80);
            make.height.offset(17);
            make.bottom.offset(0);
        }];
        
        self.countLabel = [UILabel new];
        self.countLabel.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.countLabel];
        [self.countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.offset(0);
            make.width.offset(80);
            make.height.offset(13);
            make.bottom.equalTo(weakSelf.timeLabel.mas_top).offset(0);
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
