//
//  MartshowHeaderBannersModel.h
//  BeiBei
//
//  Created by mac on 15-11-23.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MartshowHeaderBannersModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *end, *height, *login, *main_bg, *rid, *sid, *width;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *main_img;
@property (nonatomic,copy) NSString *main_subtitle;
@property (nonatomic,copy) NSString *main_title;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end
