//
//  ThirdCollectionViewCell.m
//  BeiBei
//
//  Created by mac on 15-11-24.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "ThirdCollectionViewCell.h"
#import "Masonry.h"
#import "ThemeItemCellFive.h"
#import "RequestTool.h"
#import "DressModels.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
@interface ThirdCollectionViewCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    NSMutableArray *dataArr;
    NSMutableDictionary *dic;

}
@property (nonatomic,strong) UICollectionView *ThemeCol;
@end
@implementation ThirdCollectionViewCell

- (UICollectionView *)ThemeCol
{
    if (_ThemeCol == nil) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.minimumLineSpacing = 5;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _ThemeCol = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _ThemeCol.showsVerticalScrollIndicator = NO;
        
//       _ThemeCol.backgroundColor = [UIColor lightGrayColor];
     
        [_ThemeCol registerClass:[ThemeItemCellFive class] forCellWithReuseIdentifier:@"ThemeItemCellFive"];
    
        
        _ThemeCol.delegate = self;
        _ThemeCol.dataSource = self;
    }
    return _ThemeCol;
}
#pragma mark--UICollectionViewDataSource,UICollectionViewDelegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *arr = dic[@"dataArr"];
    
    return arr.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    ThemeItemCellFive *cellFive = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellFive" forIndexPath:indexPath];
     NSArray *arr = dic[@"dataArr"];
            DressModels *model = arr[indexPath.item];
            NSString *urlStr = model.main_img;
    [cellFive.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];

    return cellFive;
}
#pragma mark--UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(310, 140);
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(18, 5, 5, 5);
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        dataArr = [[NSMutableArray alloc] init];
        dic = [[NSMutableDictionary alloc] init];
        [self.contentView addSubview:self.ThemeCol];
        
        WS(weakSelf);
        [RequestTool dressRequestSuccess:^(id success) {
//            LZLog(@"--==%@",success);
            [dataArr removeAllObjects];
            [dataArr addObjectsFromArray:success];
//            LZLog(@"%d",dataArr.count);
            [dic setObject:dataArr forKey:@"dataArr"];
            [weakSelf.ThemeCol reloadData];
        } faild:^(id faild) {
        
            
            
        }];
    
    }
    return self;
}


@end
