//
//  PromotionModel.h
//  BeiBei
//
//  Created by mac on 15-11-23.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PromotionModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *desc, *end, *login, *rid, *show_left_time, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
