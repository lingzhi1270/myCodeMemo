//
//  MartshowCatBannersModel.h
//  BeiBei
//
//  Created by mac on 15-11-24.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface babythingsModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *end, *login, *priority, *rid, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface beautyModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *end, *login, *priority, *rid, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

@interface dressModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *end, *login, *priority, *rid, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

@interface foodModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *bg, *end, *login, *priority, *rid, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface houseModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *end, *login, *priority, *rid, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface shoesModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *end, *login, *priority, *rid, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface toyModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *end, *login, *priority, *rid, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


@interface woman_dressModel : NSObject
@property (nonatomic,strong) NSNumber *begin, *end, *login, *priority, *rid, *sid;
@property (nonatomic,copy) NSString *buying_info;
@property (nonatomic,copy) NSString *desc;
@property (nonatomic,copy) NSString *img;
@property (nonatomic,copy) NSString *target;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *ver;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

