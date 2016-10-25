//
//  MainCollectionViewCell.h
//  BeiBei
//
//  Created by mac on 15-11-23.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol webDelegate;
@interface MainCollectionViewCell : UICollectionViewCell
@property (nonatomic,assign) id<webDelegate>myDelegate;
@end
@protocol webDelegate <NSObject>

- (void)reloadWebViewWithBtnTag:(NSInteger)tag target:(NSString *)target;

@end