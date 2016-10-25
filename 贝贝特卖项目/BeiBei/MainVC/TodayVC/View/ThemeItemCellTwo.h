//
//  ThemeItemCellTwo.h
//  BeiBei
//
//  Created by mac on 15-11-23.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ThemeItemCellTwo : UICollectionViewCell{
   
    NSMutableArray *btnCountArr;
}
@property (nonatomic,strong) UIView *buttonView;
@property (nonatomic,strong) NSMutableArray *array;
@property (nonatomic,strong)  UIButton *lastBtn;
@end
