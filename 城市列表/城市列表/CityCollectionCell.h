//
//  CityCollectionCell.h
//  PCN
//
//  Created by 蒙奇D路飞 on 16/8/11.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CityCollectionCell : UICollectionViewCell
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UIImageView *gpsImageView;
-(void)isShowGPSStatus:(BOOL)isShow withLocationCityName:(NSString *)cityName;
@end
