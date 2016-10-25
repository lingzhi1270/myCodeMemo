//
//  RequestTool.h
//  BeiBei
//
//  Created by mac on 15-11-21.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <Foundation/Foundation.h>

//#ifdef DEBUG
//#define Base_url @"http://124.160.136.232/martshow/1-30"
//#else
//#define Base_url @"http://www.baidu.com"
//#endif
typedef void(^OnLineBlock)(BOOL isOnLine);
typedef void(^SuccessBlock)(id success);
typedef void(^FaildBlock)(id faild);
@interface RequestTool : NSObject

+ (void)isOnline:(OnLineBlock)block;

+ (void)todayOneRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;

//第一个界面中间八个接口第三个区的数据请求
+ (void)dressRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;
+ (void)shoesRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;
+ (void)babyRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;
+ (void)toyRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;
+ (void)womanDressRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;
+ (void)houseRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;
+ (void)foodRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;
+ (void)beautyRequestSuccess:(SuccessBlock)successBlock faild:(FaildBlock)faildBlock;
@end
