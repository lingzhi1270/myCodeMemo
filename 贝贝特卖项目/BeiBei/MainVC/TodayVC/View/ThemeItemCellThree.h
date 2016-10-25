//
//  ThemeItemCellThree.h
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <UIKit/UIKit.h>

//协议的向前声明
@protocol ProDelegate;

@interface ThemeItemCellThree : UICollectionViewCell
    
@property (nonatomic,strong) UIView *promotionView;
@property (nonatomic,strong) NSMutableArray *promotionArr;
@property (nonatomic,assign) id<ProDelegate>customDelegate;
@end

@protocol ProDelegate <NSObject>

- (void)reloadWebViewWithBtnTag:(NSInteger)tag target:(NSString *)target;

@end