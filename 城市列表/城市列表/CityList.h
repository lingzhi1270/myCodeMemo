//
//  CityList.h
//  PCN
//
//  Created by 蒙奇D路飞 on 16/8/2.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^SelectCity)(NSString *cityName);
@interface CityList : UIViewController
@property (nonatomic,strong) SelectCity selectCity;
@end
