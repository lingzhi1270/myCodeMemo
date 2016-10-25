//
//  MartshowInsertBannersModel.m
//  BeiBei
//
//  Created by mac on 15-11-23.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "MartshowInsertBannersModel.h"

@implementation MartshowInsertBannersModel
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
