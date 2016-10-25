//
//  DressModels.h
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <Foundation/Foundation.h>

//DressModels
@interface DressModels : NSObject
//@property (nonatomic,strong) NSNumber *bid, *event_id, *gmt_begin, *gmt_end, * item_count, *stock;
//@property (nonatomic,copy) NSString *brand, *brand_story, *buying_info, *logo, *main_img, *mj_icon, *mj_promotion, *promotion, *seller_title, *title;
//@property (nonatomic,strong) NSMutableArray *ms_items;
@property (nonatomic,copy) NSString *main_img, *title;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

////MsItems
//@interface DressMsItems : NSObject
//@property (nonatomic,strong) NSNumber *iid, *price, *price_ori;
//@property (nonatomic,copy) NSString *img;
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
//- (instancetype)initWithDictionary:(NSDictionary *)dic;
//@end


//ShoesModel
@interface ShoesModels : NSObject

//@property (nonatomic,strong) NSNumber *bid, *event_id, *gmt_begin, *gmt_end,* item_count, *stock;
//@property (nonatomic,copy) NSString *brand, *brand_story, *buying_info, *logo, *main_img, *mj_icon, *mj_promotion, *promotion, *seller_title, *title;
//@property (nonatomic,strong) NSMutableArray *ms_items;
@property (nonatomic,copy) NSString *main_img, *title;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end


//@interface ShoesMsItems : NSObject
//@property (nonatomic,strong) NSNumber *iid, *price, *price_ori;
//@property (nonatomic,copy) NSString *img;
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
//- (instancetype)initWithDictionary:(NSDictionary *)dic;
//@end

//BabythingsModel
@interface BabythingsModels : NSObject
//@property (nonatomic,strong) NSNumber *bid, *event_id, *gmt_begin, *gmt_end,* item_count, *stock;
//@property (nonatomic,copy) NSString *brand, *brand_story, *buying_info, *logo, *main_img, *mj_icon, *mj_promotion, *promotion, *seller_title, *title;
//@property (nonatomic,strong) NSMutableArray *ms_items;
@property (nonatomic,copy) NSString *main_img, *title;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

//@interface BabythingsMsItems : NSObject
//@property (nonatomic,strong) NSNumber *iid, *price, *price_ori;
//@property (nonatomic,copy) NSString *img;
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
//- (instancetype)initWithDictionary:(NSDictionary *)dic;
//@end



//ToyModel
@interface ToyModels : NSObject

//@property (nonatomic,strong) NSNumber *bid, *event_id, *gmt_begin, *gmt_end,* item_count, *stock;
//@property (nonatomic,copy) NSString *brand, *brand_story, *buying_info, *logo, *main_img, *mj_icon, *mj_promotion, *promotion, *seller_title, *title;
//@property (nonatomic,strong) NSMutableArray *ms_items;

@property (nonatomic,copy) NSString *main_img, *title;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

//@interface ToyMsItems : NSObject
//@property (nonatomic,strong) NSNumber *iid, *price, *price_ori;
//@property (nonatomic,copy) NSString *img;
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
//- (instancetype)initWithDictionary:(NSDictionary *)dic;
//@end


//WomanDressModel
@interface WomanDressModels : NSObject

//@property (nonatomic,strong) NSNumber *bid, *event_id, *gmt_begin, *gmt_end,* item_count, *stock;
//@property (nonatomic,copy) NSString *brand, *brand_story, *buying_info, *logo, *main_img, *mj_icon, *mj_promotion, *promotion, *seller_title, *title;
//@property (nonatomic,strong) NSMutableArray *ms_items;
@property (nonatomic,copy) NSString *main_img, *title;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end

//@interface WomanDressMsItems : NSObject
//@property (nonatomic,strong) NSNumber *iid, *price, *price_ori;
//@property (nonatomic,copy) NSString *img;
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
//- (instancetype)initWithDictionary:(NSDictionary *)dic;
//@end



//HouseModel
@interface HouseModels : NSObject
//@property (nonatomic,strong) NSNumber *bid, *event_id, *gmt_begin, *gmt_end,* item_count, *stock;
//@property (nonatomic,copy) NSString *brand, *brand_story, *buying_info, *logo, *main_img, *mj_icon, *mj_promotion, *promotion, *seller_title, *title;
//@property (nonatomic,strong) NSMutableArray *ms_items;
@property (nonatomic,copy) NSString *main_img, *title;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end


//@interface HouseMsItems : NSObject
//@property (nonatomic,strong) NSNumber *iid, *price, *price_ori;
//@property (nonatomic,copy) NSString *img;
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
//- (instancetype)initWithDictionary:(NSDictionary *)dic;
//@end


//FoodModel
@interface FoodModels : NSObject
//@property (nonatomic,strong) NSNumber *bid, *event_id, *gmt_begin, *gmt_end,* item_count, *stock;
//@property (nonatomic,copy) NSString *brand, *brand_story, *buying_info, *logo, *main_img, *mj_icon, *mj_promotion, *promotion, *seller_title, *title;
//@property (nonatomic,strong) NSMutableArray *ms_items;
@property (nonatomic,copy) NSString *main_img, *title;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;
@end

//@interface FoodMsItems : NSObject
//@property (nonatomic,strong) NSNumber *iid, *price, *price_ori;
//@property (nonatomic,copy) NSString *img;
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
//- (instancetype)initWithDictionary:(NSDictionary *)dic;
//@end



//BeautyModel
@interface BeautyModels : NSObject

//@property (nonatomic,strong) NSNumber *bid, *event_id, *gmt_begin, *gmt_end,* item_count, *stock;
//@property (nonatomic,copy) NSString *brand, *brand_story, *buying_info, *logo, *main_img, *mj_icon, *mj_promotion, *promotion, *seller_title, *title;
//@property (nonatomic,strong) NSMutableArray *ms_items;
@property (nonatomic,copy) NSString *main_img, *title;
+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
- (instancetype)initWithDictionary:(NSDictionary *)dic;

@end
//
//@interface BeautyMsItems : NSObject
//@property (nonatomic,strong) NSNumber *iid, *price, *price_ori;
//@property (nonatomic,copy) NSString *img;
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic;
//- (instancetype)initWithDictionary:(NSDictionary *)dic;
//@end

