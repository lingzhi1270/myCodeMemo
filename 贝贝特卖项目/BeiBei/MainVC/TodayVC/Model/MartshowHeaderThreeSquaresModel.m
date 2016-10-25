//
//  MartshowHeaderThreeSquaresModel.m
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "MartshowHeaderThreeSquaresModel.h"

@implementation MartshowHeaderThreeSquaresModel
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
    return [[self alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
