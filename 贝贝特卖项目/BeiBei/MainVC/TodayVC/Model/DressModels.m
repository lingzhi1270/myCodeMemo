//
//  DressModels.m
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "DressModels.h"

//DressModels
@implementation DressModels
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
    return [[[self class] alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


///*重写某些属性的内容*/
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"ms_items"]) {
//        for (NSDictionary *dic in value) {
//            DressMsItems *dressMsItems = [DressMsItems modelWithDictionary:dic];
//            [self.ms_items addObject:dressMsItems];
//        }
//    }

//else{
//         //其他属性不变    在这里不能写！！！！
//        [self setValue:value forKey:key];
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end


////MsItems
//@implementation DressMsItems
//
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic
//{
//   return [[[self class] alloc] initWithDictionary:dic];
//}
//- (instancetype)initWithDictionary:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dic];
//    }
//    return self;
//}
//@end




@implementation ShoesModels
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
    return [[[self class] alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

//
///*重写某些属性的内容*/
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"ms_items"]) {
//        for (NSDictionary *dic in value) {
//            ShoesMsItems *shoesMsItems = [ShoesMsItems modelWithDictionary:dic];
//            [self.ms_items addObject:shoesMsItems];
//        }
//    }
//}
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end

//
////MsItems
//@implementation ShoesMsItems
//
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic
//{
//   return [[[self class] alloc] initWithDictionary:dic];
//}
//- (instancetype)initWithDictionary:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dic];
//    }
//    return self;
//}
//@end
//





@implementation BabythingsModels
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
    return [[[self class] alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

//
///*重写某些属性的内容*/
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"ms_items"]) {
//        for (NSDictionary *dic in value) {
//            BabythingsMsItems *babythingsMsItems = [BabythingsMsItems modelWithDictionary:dic];
//            [self.ms_items addObject:babythingsMsItems];
//        }
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end

//
////BabythingsMsItems
//@implementation BabythingsMsItems
//
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic
//{
//    return [[[self class] alloc] initWithDictionary:dic];
//}
//- (instancetype)initWithDictionary:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dic];
//    }
//    return self;
//}
//@end





@implementation ToyModels
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
    return [[[self class] alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

//
///*重写某些属性的内容*/
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"ms_items"]) {
//        for (NSDictionary *dic in value) {
//            ToyMsItems *toyMsItems = [ToyMsItems modelWithDictionary:dic];
//            [self.ms_items addObject:toyMsItems];
//        }
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end


////ToyMsItems
//@implementation ToyMsItems
//
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic
//{
//   return [[[self class] alloc] initWithDictionary:dic];
//}
//- (instancetype)initWithDictionary:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dic];
//    }
//    return self;
//}
//@end




@implementation WomanDressModels
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
    return [[[self class] alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


///*重写某些属性的内容*/
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"ms_items"]) {
//        for (NSDictionary *dic in value) {
//            WomanDressMsItems *womanDressMsItems = [WomanDressMsItems modelWithDictionary:dic];
//            [self.ms_items addObject:womanDressMsItems];
//        }
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end


////WomanDressMsItems
//@implementation WomanDressMsItems
//
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic
//{
//    return [[[self class] alloc] initWithDictionary:dic];
//}
//- (instancetype)initWithDictionary:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dic];
//    }
//    return self;
//}
//@end





@implementation HouseModels
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
     return [[[self class] alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


///*重写某些属性的内容*/
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"ms_items"]) {
//        for (NSDictionary *dic in value) {
//            HouseMsItems *houseMsItems = [HouseMsItems modelWithDictionary:dic];
//            [self.ms_items addObject:houseMsItems];
//        }
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end

//
////HouseMsItems
//@implementation HouseMsItems
//
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic
//{
//     return [[[self class] alloc] initWithDictionary:dic];
//}
//- (instancetype)initWithDictionary:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dic];
//    }
//    return self;
//}
//@end






@implementation FoodModels
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
     return [[[self class] alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}


///*重写某些属性的内容*/
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"ms_items"]) {
//        for (NSDictionary *dic in value) {
//            FoodMsItems *foodMsItems = [FoodMsItems modelWithDictionary:dic];
//            [self.ms_items addObject:foodMsItems];
//        }
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end


////FoodMsItems
//@implementation FoodMsItems
//
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic
//{
//     return [[[self class] alloc] initWithDictionary:dic];
//}
//- (instancetype)initWithDictionary:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dic];
//    }
//    return self;
//}
//@end
//




@implementation BeautyModels
+ (instancetype)modelWithDictionary:(NSDictionary *)dic
{
     return [[[self class] alloc] initWithDictionary:dic];
}
- (instancetype)initWithDictionary:(NSDictionary *)dic
{
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

//
///*重写某些属性的内容*/
//- (void)setValue:(id)value forKey:(NSString *)key
//{
//    if ([key isEqualToString:@"ms_items"]) {
//        for (NSDictionary *dic in value) {
//            BeautyMsItems *beautyMsItems = [BeautyMsItems modelWithDictionary:dic];
//            [self.ms_items addObject:beautyMsItems];
//        }
//    }
//}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}
@end


////BeautyMsItems
//@implementation BeautyMsItems
//
//+ (instancetype)modelWithDictionary:(NSDictionary *)dic
//{
//     return [[[self class] alloc] initWithDictionary:dic];
//}
//- (instancetype)initWithDictionary:(NSDictionary *)dic
//{
//    self = [super init];
//    if (self) {
//        [self setValuesForKeysWithDictionary:dic];
//    }
//    return self;
//}
