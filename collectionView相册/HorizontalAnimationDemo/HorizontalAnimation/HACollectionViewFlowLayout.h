//
//  HACollectionViewFlowLayout.h
//  LetMeSpend
//
//  Created by 袁斌 on 16/5/13.
//  Copyright © 2016年 https://github.com/DefaultYuan/CustomTakePhotoAndCollectionViewAnimation. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HACollectionContanst.h"

@protocol HACollectionViewFlowLayoutDelegate <NSObject>

- (void)collectionViewDidScrollowTo:(NSInteger)index;

@end

@interface HACollectionViewFlowLayout : UICollectionViewFlowLayout
/// delegate
@property (nonatomic, assign) id<HACollectionViewFlowLayoutDelegate> delegate;
/// 是否需要透明度
@property (nonatomic, assign) BOOL isAlpha;


@end
