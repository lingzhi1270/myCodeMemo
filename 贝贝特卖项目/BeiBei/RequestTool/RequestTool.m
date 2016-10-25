//
//  RequestTool.m
//  BeiBei
//
//  Created by mac on 15-11-21.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "RequestTool.h"
#import "AFNetworking.h"
#import "BannarModel.h"
#import "ButtonModel.h"
#import "PromotionModel.h"
#import "MartshowHeaderBannersModel.h"
#import "MartshowInsertBannersModel.h"
#import "MartshowCatBannersModel.h"
#import "MartshowHeaderTwoSquaresModel.h"
#import "MartshowHeaderThreeSquaresModel.h"
#import "NSString+DirectoryPath.h"
#import "NSString+MD5.h"
#import "MartshowCatShortcutsModel.h"
#import "DressModels.h"
@implementation RequestTool

+ (void)isOnline:(OnLineBlock)block
{
    //加__weak  防止循环引用
  __weak AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    //开始检测网络    Monitoring监视
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        if (status == AFNetworkReachabilityStatusNotReachable) {
            if (block) {
                block(NO);
            }
        }else{
            if (block) {
                block(YES);
            }
        }
        //停止检测网络
        [manager stopMonitoring];
    }];
}


+ (void)todayOneRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{ /*
   逻辑
   1.如果没联网，那么读取本地缓存文件
   2.如果联网，读取服务器数据，并且还存到本地
   */
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/resource/ads-android-2147483646-xiaomi-0-3.4.8-0.html"];
//    NSString *newUrl = [url MD5];
    
//    NSString *path = [NSString stringWithFormat:@"%@/%@",[NSString getCachesPath],newUrl];
    
    [self isOnline:^(BOOL isOnLine) {
        if (isOnLine) {
            AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
            
            [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                      LZLog(@"%@",responseObject);
                NSArray *adsArr = responseObject[@"ads"];
                NSMutableArray *bannarArray = [[NSMutableArray alloc] initWithCapacity:0];
                for (NSDictionary *dic in adsArr) {
                    BannarModel *bannarModel = [BannarModel modelWithDictionary:dic];
                    [bannarArray addObject:bannarModel];
                }
                
                NSArray *iconArr = responseObject[@"icon_shortcuts"];
                NSMutableArray *buttonArray = [[NSMutableArray alloc] initWithCapacity:0];
                for (NSDictionary *dic in iconArr) {
                    ButtonModel *buttonModel = [ButtonModel modelWithDictionary:dic];
                    [buttonArray addObject:buttonModel];
                }
                
                NSArray *promotionArr = responseObject[@"promotion_shortcuts"];
                NSMutableArray *promotionArray = [[NSMutableArray alloc] initWithCapacity:0];
                for (NSDictionary *dic in promotionArr) {
                    PromotionModel *promotionModel = [PromotionModel modelWithDictionary:dic];
                    [promotionArray addObject:promotionModel];
                }
                NSArray *hotSaleHeaderArr = responseObject[@"martshow_header_banners"];
                NSMutableArray *hahArray = [[NSMutableArray alloc] initWithCapacity:0];
                for (NSDictionary *dic in hotSaleHeaderArr) {
                    MartshowHeaderBannersModel *headerModel = [MartshowHeaderBannersModel modelWithDictionary:dic];
                    [hahArray addObject:headerModel];
                }
                NSArray *hotSaleInsertArr = responseObject[@"martshow_insert_squares"];
                NSMutableArray *hsiArray = [[NSMutableArray alloc] initWithCapacity:0];
                //        LZLog(@"==%d",hotSaleHeaderArr.count);
                for (NSDictionary *dic in hotSaleInsertArr) {
                    MartshowInsertBannersModel *insertModel = [MartshowInsertBannersModel modelWithDictionary:dic];
                    [hsiArray addObject:insertModel];
                }
                
                NSArray *twoSArr = responseObject[@"martshow_header_two_squares"];
                NSMutableArray *twoSquaresArr = [[NSMutableArray alloc] initWithCapacity:0];
                for (NSDictionary *dic in twoSArr) {
                    MartshowHeaderTwoSquaresModel *model = [MartshowHeaderTwoSquaresModel modelWithDictionary:dic];
                    [twoSquaresArr addObject:model];
                }
                
                NSArray *threeSArr = responseObject[@"martshow_header_three_squares"];
                NSMutableArray *threeSquaresArr = [[NSMutableArray alloc] initWithCapacity:0];
                for (NSDictionary *dic in threeSArr) {
                    MartshowHeaderThreeSquaresModel *model = [MartshowHeaderThreeSquaresModel modelWithDictionary:dic];
                    [threeSquaresArr addObject:model];
                }
               
                
                //------------martshow_cat_banners
                NSDictionary *catBannersDic = responseObject[@"martshow_cat_banners"];
//                      LZLog(@"%@",catDic);
            
                NSMutableArray *badythingArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *badythingArr = catBannersDic[@"babythings--"];
//                LZLog(@"====%@",badythingArr);
                for (NSDictionary *dic in badythingArr) {
                    babythingsModel *model = [babythingsModel modelWithDictionary:dic];
                    [badythingArray addObject:model];
                }
                
                NSMutableArray *beautyArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *beautyArr = catBannersDic[@"beauty--"];
                for (NSMutableDictionary *dic in beautyArr) {
                    beautyModel *model = [beautyModel modelWithDictionary:dic];
                    [beautyArray addObject:model];
                }
                
                NSMutableArray *dressArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *dressArr = catBannersDic[@"dress--"];
                for (NSMutableDictionary *dic in dressArr) {
                    dressModel *model = [dressModel modelWithDictionary:dic];
                    [dressArray addObject:model];
                }

                NSMutableArray *foodArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *foodArr = catBannersDic[@"food--"];
                for (NSMutableDictionary *dic in foodArr) {
                    foodModel *model = [foodModel modelWithDictionary:dic];
                    [foodArray addObject:model];
                }

                NSMutableArray *houseArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *houseArr = catBannersDic[@"house--"];
                for (NSMutableDictionary *dic in houseArr) {
                    houseModel *model = [houseModel modelWithDictionary:dic];
                    [houseArray addObject:model];
                }

                NSMutableArray *shoesArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *shoesArr = catBannersDic[@"shoes--"];
                for (NSMutableDictionary *dic in shoesArr) {
                    shoesModel *model = [shoesModel modelWithDictionary:dic];
                    [shoesArray addObject:model];
                }

                NSMutableArray *toyArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *toyArr = catBannersDic[@"toy--"];
                for (NSMutableDictionary *dic in toyArr) {
                    toyModel *model = [toyModel modelWithDictionary:dic];
                    [toyArray addObject:model];
                }

                NSMutableArray *womanDressArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *womanDressArr = catBannersDic[@"woman_dress--"];
                for (NSMutableDictionary *dic in womanDressArr) {
                    woman_dressModel *model = [woman_dressModel modelWithDictionary:dic];
                    [womanDressArray addObject:model];
                }
                
                //------------------catShortcutsDic
                NSDictionary *catShortcutsDic = responseObject[@"martshow_cat_shortcuts"];
                //                      LZLog(@"%@",catDic);
                
                NSMutableArray *badythingShortArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *badythingShortArr = catShortcutsDic[@"babythings--"];
                //                LZLog(@"====%@",badythingArr);
                for (NSDictionary *dic in badythingShortArr) {
                    babythingsShortModel *model = [babythingsShortModel modelWithDictionary:dic];
                    [badythingShortArray addObject:model];
                }
                
                NSMutableArray *beautyShortArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *beautyShortArr = catShortcutsDic[@"beauty--"];
                for (NSMutableDictionary *dic in beautyShortArr) {
                    beautyShortModel *model = [beautyShortModel modelWithDictionary:dic];
                    [beautyShortArray addObject:model];
                }
                
                NSMutableArray *dressShortArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *dressShortArr = catShortcutsDic[@"dress--"];
                for (NSMutableDictionary *dic in dressShortArr) {
                    dressShortModel *model = [dressShortModel modelWithDictionary:dic];
                    [dressShortArray addObject:model];
                }
                
                NSMutableArray *foodShortArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *foodShortArr = catShortcutsDic[@"food--"];
                for (NSMutableDictionary *dic in foodShortArr) {
                    foodShortModel *model = [foodShortModel modelWithDictionary:dic];
                    [foodShortArray addObject:model];
                }
                
                NSMutableArray *houseShortArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *houseShortArr = catShortcutsDic[@"house--"];
                for (NSMutableDictionary *dic in houseShortArr) {
                    houseShortModel *model = [houseShortModel modelWithDictionary:dic];
                    [houseShortArray addObject:model];
                }
                
                NSMutableArray *shoesShortArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *shoesShortArr = catShortcutsDic[@"shoes--"];
                for (NSMutableDictionary *dic in shoesShortArr) {
                    shoesShortModel *model = [shoesShortModel modelWithDictionary:dic];
                    [shoesShortArray addObject:model];
                }
                
                NSMutableArray *toyShortArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *toyShortArr = catShortcutsDic[@"toy--"];
                for (NSMutableDictionary *dic in toyShortArr) {
                    toyShortModel *model = [toyShortModel modelWithDictionary:dic];
                    [toyShortArray addObject:model];
                }
                
                NSMutableArray *womanDressShortArray = [[NSMutableArray alloc] initWithCapacity:0];
                NSArray *womanDressShortArr = catShortcutsDic[@"woman_dress--"];
                for (NSMutableDictionary *dic in womanDressShortArr) {
                    woman_dressShortModel *model = [woman_dressShortModel modelWithDictionary:dic];
                    [womanDressShortArray addObject:model];
                }


                NSDictionary *catBannarDic = @{@"babythings":badythingArray, @"beauty":beautyArray,@"dress":dressArray,@"food":foodArray,@"house":houseArray,@"shoes":shoesArray,@"toy":toyArray,@"woman_dress":womanDressArray};
                 NSDictionary *catShortDic = @{@"babythingsShort":badythingShortArray, @"beautyShort":beautyShortArray,@"dressShort":dressShortArray,@"foodShort":foodShortArray,@"houseShort":houseShortArray,@"shoesShort":shoesShortArray,@"toyShort":toyShortArray,@"woman_dressShort":womanDressShortArray};
//                LZLog(@"==%@",catBannarDic);
                NSDictionary *dic = @{@"ads": bannarArray,@"icon_shortcuts":buttonArray,@"promotion_shortcuts":promotionArray,@"martshow_header_banners":hahArray,@"martshow_insert_squares":hsiArray,@"martshow_header_two_squares":twoSquaresArr,@"martshow_header_three_squares":threeSquaresArr,@"martshow_cat_banners":catBannarDic,@"martshow_cat_shortcuts":catShortDic};
                NSMutableArray *dataArray = [[NSMutableArray alloc] initWithObjects:dic, nil];
//                LZLog(@"%@",dataArray);
                   //编码   （有网） 把数据存在path路径的文件夹中  同时返回从网络上请求过来的数据
//                [NSKeyedArchiver archiveRootObject:dataArray toFile:path];
                if (successBlock) {
                    successBlock(dataArray);
                }
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                LZLog(@"%@",error);
            }];
        }else{
             //解码   在本地文件夹中解码，（没网）返回存在缓存在本地的数据
//            id data = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
//            
//            if (successBlock) {
//                successBlock(data);
//            }
        }
    }];
}

+ (void)dressRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/martshow/search/1-30-dress---0-1.html"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//       LZLog(@"===%@",responseObject);
        
        NSMutableArray *dressArray = [[NSMutableArray alloc] init];
        NSArray *arr = responseObject[@"martshows"];
        for (NSDictionary *dic in arr) {
            DressModels *model = [DressModels modelWithDictionary:dic];
            [dressArray addObject:model];
        }
        if (successBlock) {
            successBlock(dressArray);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}
+ (void)shoesRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/martshow/search/1-30-shoes---0-1.html"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//               LZLog(@"===%@",responseObject);
        
        NSMutableArray *shoseArray = [[NSMutableArray alloc] init];
        NSArray *arr = responseObject[@"martshows"];
        for (NSDictionary *dic in arr) {
            ShoesModels *model = [ShoesModels modelWithDictionary:dic];
            [shoseArray addObject:model];
        }
        
        if (successBlock) {
            successBlock(shoseArray);
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
}];

}
+ (void)babyRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/martshow/search/1-30-babythings---0-1.html"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//              LZLog(@"===%@",responseObject);
        
        NSMutableArray *babyArray = [[NSMutableArray alloc] init];
        NSArray *arr = responseObject[@"martshows"];
        for (NSDictionary *dic in arr) {
            BabythingsModels *model = [BabythingsModels modelWithDictionary:dic];
            [babyArray addObject:model];
        }
        if (successBlock) {
            successBlock(babyArray);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
+ (void)toyRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/martshow/search/1-30-toy---0-1.html"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        LZLog(@"===%@",responseObject);
        
        NSMutableArray *toyArray = [[NSMutableArray alloc] init];
        NSArray *arr = responseObject[@"martshows"];
        for (NSDictionary *dic in arr) {
            ToyModels *model = [ToyModels modelWithDictionary:dic];
            [toyArray addObject:model];
        }

        if (successBlock) {
            successBlock(toyArray);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
+ (void)womanDressRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/martshow/search/1-30-woman_dress---0-1.html"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
//                LZLog(@"===%@",responseObject);
        NSMutableArray *womanDressArray = [[NSMutableArray alloc] init];
        NSArray *arr = responseObject[@"martshows"];
        for (NSDictionary *dic in arr) {
            WomanDressModels *model = [WomanDressModels modelWithDictionary:dic];
            [womanDressArray addObject:model];
        }

        if (successBlock) {
            successBlock(womanDressArray);
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
+ (void)houseRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/martshow/search/1-30-house---0-1.html"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        LZLog(@"===%@",responseObject);
        
        NSMutableArray *houseArray = [[NSMutableArray alloc] init];
        NSArray *arr = responseObject[@"martshows"];
        for (NSDictionary *dic in arr) {
            HouseModels *model = [HouseModels modelWithDictionary:dic];
            [houseArray addObject:model];
        }

        
        if (successBlock) {
            successBlock(houseArray);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
+ (void)foodRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/martshow/search/1-30-food---0-1.html"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        LZLog(@"===%@",responseObject);
        
        NSMutableArray *foodArray = [[NSMutableArray alloc] init];
        NSArray *arr = responseObject[@"martshows"];
        for (NSDictionary *dic in arr) {
            FoodModels *model = [FoodModels modelWithDictionary:dic];
            [foodArray addObject:model];
        }

        
        if (successBlock) {
            successBlock(foodArray);
        }
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
+ (void)beautyRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock
{
    NSString *url = [NSString stringWithFormat:@"http://sapi.beibei.com/martshow/search/1-30-beauty---0-1.html"];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //        LZLog(@"===%@",responseObject);
        
        NSMutableArray *beautyArray = [[NSMutableArray alloc] init];
        NSArray *arr = responseObject[@"martshows"];
        for (NSDictionary *dic in arr) {
            BeautyModels *model = [BeautyModels modelWithDictionary:dic];
            [beautyArray addObject:model];
        }

        if (successBlock) {
            successBlock(beautyArray);
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}
@end
