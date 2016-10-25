//
//  CityCollectionCell.m
//  PCN
//
//  Created by 蒙奇D路飞 on 16/8/11.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import "CityCollectionCell.h"
#import "CommonDefine.h"
@implementation CityCollectionCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.borderColor = UIColorFromRGBA(0x418df9, 1).CGColor;
        self.layer.borderWidth = 1;
        self.backgroundColor = [UIColor whiteColor];
        self.gpsImageView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 20, 20)];
        NSMutableArray *imageArr = [NSMutableArray array];
        for (int i = 1; i<=3; i++) {
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"city_locating_frame%d",i]];
            [imageArr addObject:image];
        }
        
        self.gpsImageView.animationImages = imageArr;
        self.gpsImageView.animationDuration = 1;
        self.gpsImageView.animationRepeatCount = INT_MAX;
        
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        self.titleLabel.textColor = UIColorFromRGBA(0x418df9, 1);
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:self.gpsImageView];
        [self addSubview:self.titleLabel];
    }
    return self;
}
-(void)isShowGPSStatus:(BOOL)isShow withLocationCityName:(NSString *)cityName{
    [self.gpsImageView stopAnimating];
    CGRectSetX(self.titleLabel.frame, self.gpsImageView.frame.size.width+5+5);
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    if (isShow) {
        CGRectSetWidth(self.titleLabel.frame, ScreenWidth);
        self.layer.borderWidth = 0;
        self.gpsImageView.image = [UIImage imageNamed:@"city_locate_failed"];
        self.titleLabel.font = [UIFont systemFontOfSize:12];
        self.titleLabel.textColor = [UIColor lightGrayColor];
        self.titleLabel.text = @"未能获取到您的位置,请轻轻动下手指选择城市";
    }else{
        CGRectSetWidth(self.titleLabel.frame, self.frame.size.width+5 +5);
        
        self.layer.borderWidth = 1;
        self.gpsImageView.image = [UIImage imageNamed:@"city_locate_success"];
        self.titleLabel.font = [UIFont systemFontOfSize:17];
        self.titleLabel.text = cityName;
    }
}
@end
