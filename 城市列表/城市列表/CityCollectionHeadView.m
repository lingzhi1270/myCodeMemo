//
//  CityCollectionHeadView.m
//  PCN
//
//  Created by 蒙奇D路飞 on 16/8/11.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import "CityCollectionHeadView.h"

@implementation CityCollectionHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.sectionTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, 0, frame.size.width-5, frame.size.height)];
        self.sectionTitleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self addSubview:self.sectionTitleLabel];
    }
    return self;
}
@end
