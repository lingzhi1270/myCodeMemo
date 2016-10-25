//
//  HAMainAnimationView.h
//  LetMeSpend
//
//  Created by 袁斌 on 16/5/13.
//  Copyright © 2016年 https://github.com/DefaultYuan/CustomTakePhotoAndCollectionViewAnimation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HACollectItem.h"

@protocol HAMainAnimationViewDelegate <NSObject>

- (void)didSeletedHAMainAnimationViewItem:(HACollectItem *)item;

- (void)didCloseHAMainAnimationView;

@end

@interface HAMainAnimationView : UIView

/// delegate
@property (nonatomic, assign) id<HAMainAnimationViewDelegate> delegate;

/// datas
@property (nonatomic, strong) NSArray<HACollectItem *> *dataArray;

- (void)showInSuperView:(UIView *)superView;

//- (void)dismiss;

@end
