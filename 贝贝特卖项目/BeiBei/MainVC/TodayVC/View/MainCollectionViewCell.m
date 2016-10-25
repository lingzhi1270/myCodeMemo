//
//  MainCollectionViewCell.m
//  BeiBei
//
//  Created by mac on 15-11-23.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "MainCollectionViewCell.h"
#import "ThemeItemCellOne.h"
#import "ThemeItemCellTwo.h"
#import "ThemeItemCellThree.h"
#import "ThemeItemCellFour.h"
#import "ThemeItemCellFive.h"
#import "CCAdsPlayView.h"
#import "RequestTool.h"
#import "BannarModel.h"
#import "Masonry.h"
#import "PromotionModel.h"
#import "MartshowHeaderBannersModel.h"
#import "MartshowInsertBannersModel.h"
#import "MartshowCatBannersModel.h"
#import "MartshowHeaderTwoSquaresModel.h"
#import "MartshowHeaderThreeSquaresModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
@interface MainCollectionViewCell()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate,ProDelegate>{
    NSMutableArray *array;
    NSMutableDictionary *dataDic;
    NSMutableArray *bannarArr;
    NSMutableArray *buttonArr;
    NSMutableArray *promotionArray;
    NSMutableArray *hahArray;
    NSMutableArray *hsiArray;
    NSMutableArray *mcbArray;
    NSMutableArray *twoSquaresArr;
    NSMutableArray *threeSquaresArr;
    
}
@property (nonatomic,strong) UICollectionView *ThemeCol;


@end
@implementation MainCollectionViewCell

#pragma mark -- 懒加载collectionView（ThemeCol）
- (UICollectionView *)ThemeCol
{
    if (_ThemeCol == nil) {
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        flowLayout.minimumInteritemSpacing = 5;
        flowLayout.minimumLineSpacing = 5;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _ThemeCol = [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        _ThemeCol.showsVerticalScrollIndicator = NO;
        
        _ThemeCol.backgroundColor = [UIColor lightGrayColor];
        [_ThemeCol registerClass:[ThemeItemCellOne class] forCellWithReuseIdentifier:@"ThemeItemCellOne"];
        [_ThemeCol registerClass:[ThemeItemCellTwo class] forCellWithReuseIdentifier:@"ThemeItemCellTwo"];
        [_ThemeCol registerClass:[ThemeItemCellThree class] forCellWithReuseIdentifier:@"ThemeItemCellThree"];
        [_ThemeCol registerClass:[ThemeItemCellFour class] forCellWithReuseIdentifier:@"ThemeItemCellFour"];
         [_ThemeCol registerClass:[ThemeItemCellFive class] forCellWithReuseIdentifier:@"ThemeItemCellFive"];
        
        
        //注册区头
        [_ThemeCol registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
        
        _ThemeCol.delegate = self;
        _ThemeCol.dataSource = self;
    }
    return _ThemeCol;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //初始化每个数组
        array = [[NSMutableArray alloc] initWithCapacity:0];
        dataDic = [[NSMutableDictionary alloc] init];
        bannarArr = [[NSMutableArray alloc] initWithCapacity:0];
        buttonArr = [[NSMutableArray alloc] initWithCapacity:0];
        promotionArray = [[NSMutableArray alloc] initWithCapacity:0];
        hahArray = [[NSMutableArray alloc] initWithCapacity:0];;
        hsiArray = [[NSMutableArray alloc] initWithCapacity:0];
        mcbArray = [[NSMutableArray alloc] initWithCapacity:0];
        twoSquaresArr = [[NSMutableArray alloc] initWithCapacity:0];
        threeSquaresArr = [[NSMutableArray alloc] initWithCapacity:0];
        
      //将colleTionView加载到cell的contentView上
        [self.contentView addSubview:self.ThemeCol];
        
    //请求数据
        WS(weakSelf)
        [RequestTool todayOneRequestSuccess:^(id success) {
//            LZLog(@"%@",success);
           [array removeAllObjects];
            [array addObjectsFromArray:success];
            [weakSelf.ThemeCol reloadData];
        } faild:^(id faild) {
           
        }];
    }
    return self;
}
#pragma mark--UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 6;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 2;
    }else if (section == 1){
        return 1;
    }else if (section == 2){
        return 3;
    }else if (section == 3){
        return 6;
    }else if (section == 4){
        return 3;
    }else {
        return 3;
    }
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
        if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
            
            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header" forIndexPath:indexPath];
            headerView.backgroundColor = [UIColor whiteColor];
            //区头的设置
            UIView *imgView = [self viewWithTag:100];
            UILabel *label = (UILabel *)[self viewWithTag:200];
            if (imgView == nil) {
                imgView = [UIImageView new];
                imgView.tag = 100;
            }
            imgView.backgroundColor = [UIColor blueColor];
                [headerView addSubview:imgView];
                 //约束
                [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.offset(8);
                    make.left.offset(5);
                    make.width.offset(10);
                    make.height.offset(15);
                }];

            if (label == nil) {
                label = [UILabel new];
                label.tag = 200;
            }
            
            
            if (indexPath.section == 2) {
                label.text = @"热门特卖";
                label.textColor = [UIColor colorWithRed:0.182 green:0.188 blue:0.205 alpha:1.000];
                [headerView addSubview:label];
                   //约束
                [label mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.offset(5);
                    make.left.equalTo(imgView.mas_right).offset(10);
                    make.width.offset(160);
                    make.height.offset(20);
                }];

            }
            return headerView;
        }
    return nil;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //for循环取字典
    for (int i = 0; i < array.count; i ++) {
        dataDic = array[i];
//        LZLog(@"====%@",dataDic);
    }
    if (indexPath.section == 0) {
        switch (indexPath.item) {
            case 0:{
                ThemeItemCellOne *cellOne = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellOne" forIndexPath:indexPath];
                
                bannarArr = dataDic[@"ads"];
                //图片数组
                NSMutableArray *imageArray = [[NSMutableArray alloc] initWithCapacity:0];
                 //写成i < bannArr.count  不能写具体的值不然会崩
                for (int i = 0 ;i < bannarArr.count; i ++) {
                    BannarModel *model = bannarArr[i];
                    NSString *str = model.img;
                    [imageArray addObject:str];
                }
                
                //广告轮播第三方
                CCAdsPlayView *apView = [CCAdsPlayView adsPlayViewWithFrame:cellOne.bounds imageGroup:imageArray];
//                滚动点居右
                apView.pageContolAliment = CCPageContolAlimentRight;
              
                [cellOne.contentView addSubview:apView];
                  apView.placeHoldImage = [UIImage imageNamed:@"loading_leimu_failed"];
                [apView startWithTapActionBlock:^(NSInteger index) {
                    
                }];
                return cellOne;
            }
             break;
            case 1:{
                ThemeItemCellTwo *cellTwo = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellTwo" forIndexPath:indexPath];
                //直接把数组传过去
                buttonArr = dataDic[@"icon_shortcuts"];
                cellTwo.array = buttonArr;

                return cellTwo;
            }
                break;
            default:
                break;
        }
        
    }else if(indexPath.section == 1){
        ThemeItemCellThree *cellThree = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellThree" forIndexPath:indexPath];
//        cellThree.backgroundColor = [UIColor yellowColor];
        promotionArray = dataDic[@"promotion_shortcuts"];
//        LZLog(@"%@",promotionArray);
        //直接传数组
        cellThree.promotionArr = promotionArray;
        cellThree.customDelegate = self;
        return cellThree;
        
    }else if(indexPath.section == 2){
        
       ThemeItemCellFour *cellFour = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellFour" forIndexPath:indexPath];
        hahArray = dataDic[@"martshow_header_banners"];
        
            MartshowHeaderBannersModel *model = hahArray[indexPath.item];
            NSString *urlStr = model.img;
            [cellFour.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            return cellFour;
            
        }else if(indexPath.section == 3){
            ThemeItemCellFour *cellFour = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellFour" forIndexPath:indexPath];
            twoSquaresArr = dataDic[@"martshow_header_two_squares"];
            MartshowHeaderTwoSquaresModel *model = twoSquaresArr[indexPath.item];
            NSString *urlStr = model.img;
            [cellFour.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            return cellFour;
        }else if(indexPath.section == 4){
        
                ThemeItemCellFour *cellFour = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellFour" forIndexPath:indexPath];
            threeSquaresArr = dataDic[@"martshow_header_three_squares"];
            MartshowHeaderThreeSquaresModel *model = threeSquaresArr[indexPath.item];
            NSString *urlStr = model.img;
            [cellFour.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
                return cellFour;
        }else{
        ThemeItemCellFive *cellFive = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellFive" forIndexPath:indexPath];
           
            hsiArray = dataDic[@"martshow_insert_squares"];
            
                MartshowInsertBannersModel *model = hsiArray[indexPath.item];
                NSString *urlStr = model.img;
            [cellFive.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            cellFive.nameLabel.text = model.title;
            cellFive.nameLabel.font = [UIFont systemFontOfSize:13];
            
            cellFive.countLabel.text = model.buying_info;
            cellFive.countLabel.font = [UIFont systemFontOfSize:10];
            cellFive.countLabel.textAlignment = NSTextAlignmentRight;
        return cellFive;
    }
    return nil;
}
#pragma mark -- UICollectionViewDelegate


#pragma mark -- UICollectionViewDelegateFlowLayout
//返回区头高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section == 2) {
        return CGSizeMake(310, 30);
    }else{
        return CGSizeZero;
    }
}
//设置单元格大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:{
            switch (indexPath.item) {
                case 0:
                    return CGSizeMake(320, 100);
                case 1:
                    return CGSizeMake(310, 66);
            }
        }
        case 1:{
            return CGSizeMake(310, 140);
        }
        case 2:{
                    return CGSizeMake(310, 100);
        }
        case 3:{
                 return CGSizeMake(152.5, 152.5);
        }
        case 4:{
                    return CGSizeMake(100, 152.5);
        }
        case 5:{
            return CGSizeMake(310, 160);
        }
        default:
            return CGSizeZero;
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(8, 5, 5, 5);
    }
    return UIEdgeInsetsMake(5, 5, 5, 5);
}
#pragma mark --customDelegate
- (void)reloadWebViewWithBtnTag:(NSInteger)tag target:(NSString *)target
{
    if (_myDelegate != nil && [_myDelegate respondsToSelector:@selector(reloadWebViewWithBtnTag: target:)]){
        
        [_myDelegate reloadWebViewWithBtnTag:tag target:target];
    }
}
@end
