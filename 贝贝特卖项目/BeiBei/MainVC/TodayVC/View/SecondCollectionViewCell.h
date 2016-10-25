//
//  SecondCollectionViewCell.h
//  BeiBei
//
//  Created by mac on 15-11-24.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SecondCollectionViewCell : UICollectionViewCell
//用可变数组
@property (nonatomic,strong) NSDictionary *dic;
@property (nonatomic,assign) NSInteger selectIndex;
@property (nonatomic,strong) NSDictionary *shortDic;
@property (nonatomic,strong) NSDictionary *allDataDic;
@end
