//
//  HACollectionContanst.h
//  LetMeSpend
//
//  Created by 袁斌 on 16/5/13.
//  Copyright © 2016年 https://github.com/DefaultYuan/CustomTakePhotoAndCollectionViewAnimation. All rights reserved.
//

#import <UIKit/UIKit.h>


//颜色
#define RGB(r,g,b)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define UIColorWithHex(x) RGB(((x)&0xFF0000) >> 16, ((x)&0xFF00) >> 8 ,  ((x)&0xFF))

#define kMainWidth [UIScreen  mainScreen].bounds.size.width
#define kMainHeight [UIScreen mainScreen].bounds.size.height

UIKIT_EXTERN const CGFloat HAImageScale;//图片宽高比
UIKIT_EXTERN const CGFloat HALineSpacing;//itme 间隔
UIKIT_EXTERN const CGFloat HAZoomScale;//缩放比例
UIKIT_EXTERN const CGFloat HAMinZoomScale;//缩小比例

