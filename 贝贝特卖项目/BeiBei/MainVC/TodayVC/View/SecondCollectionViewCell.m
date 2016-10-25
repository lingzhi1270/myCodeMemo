//
//  SecondCollectionViewCell.m
//  BeiBei
//
//  Created by mac on 15-11-24.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "SecondCollectionViewCell.h"
#import "CustomOneCell.h"
#import "ThemeItemCellFive.h"
#import "Masonry.h"
#import "MartshowCatBannersModel.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
#import "MartshowCatShortcutsModel.h"
#import "DressModels.h"
@interface SecondCollectionViewCell()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    NSMutableArray *babythingsArr;
    NSMutableArray *beautyArr;
    NSMutableArray *dressArr;
    NSMutableArray *foodArr;
    NSMutableArray *houseArr;
    NSMutableArray *shoesArr;
    NSMutableArray *toyArr;
    NSMutableArray *womanDressArr;
    
    NSMutableArray *babythingsArray;
    NSMutableArray *beautyArray;
    NSMutableArray *dressArray;
    NSMutableArray *foodArray;
    NSMutableArray *houseArray;
    NSMutableArray *shoesArray;
    NSMutableArray *toyArray;
    NSMutableArray *womanDressArray;
    
    NSMutableArray *babythingsShortArr;
    NSMutableArray *beautyShortArr;
    NSMutableArray *dressShortArr;
    NSMutableArray *foodShortArr;
    NSMutableArray *houseShortArr;
    NSMutableArray *shoesShortArr;
    NSMutableArray *toyShortArr;
    NSMutableArray *womanDressShortArr;
    

}
@property(nonatomic,strong)UICollectionView *ThemeCol;
@end
@implementation SecondCollectionViewCell

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
        
        [_ThemeCol registerClass:[CustomOneCell class] forCellWithReuseIdentifier:@"CustomOneCell"];
        [_ThemeCol registerClass:[ThemeItemCellFive class] forCellWithReuseIdentifier:@"ThemeItemCellFive"];
        
        
        _ThemeCol.delegate = self;
        _ThemeCol.dataSource = self;
 
       }
   return _ThemeCol;
}
#pragma mark--UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }else if (section == 1){
        return 4;
    }else{
        NSArray *arr = self.allDataDic[@"dress"];
        
        return arr.count;
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CustomOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomOneCell" forIndexPath:indexPath];
        switch (self.selectIndex) {
            case 1:{
                dressArr = self.dic[@"dress"];
                dressModel *model = dressArr[indexPath.section];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
                
            }
                break;
            case 2:{
                shoesArr = self.dic[@"shoes"];
                shoesModel *model = shoesArr[indexPath.section];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            case 3:{
                babythingsArr = self.dic[@"babythings"];
                babythingsModel *model = babythingsArr[indexPath.section];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;

            case 4:{
                
                toyArr = self.dic[@"toy"];
                toyModel *model = toyArr[indexPath.section];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];

            }
                break;

            case 5:{
                
                womanDressArr = self.dic[@"woman_dress"];
                woman_dressModel *model = womanDressArr[indexPath.section];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];            }
                break;

            case 6:{
        
                houseArr = self.dic[@"house"];
                houseModel *model = houseArr[indexPath.section];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;

            case 7:{
            
                foodArr = self.dic[@"food"];
                foodModel *model = foodArr[indexPath.section];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            case 8:{
                
                beautyArr = self.dic[@"beauty"];
                beautyModel *model = beautyArr[indexPath.section];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];

            }
                break;

            default:
                break;
        }
            return cell;
    }else if (indexPath.section == 1){
        CustomOneCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CustomOneCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor greenColor];
        switch (self.selectIndex) {
            case 1:{
                dressShortArr = self.shortDic[@"dressShort"];
                dressShortModel *model = dressShortArr[indexPath.item];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            case 2:{
                shoesShortArr = self.shortDic[@"shoesShort"];
                shoesShortModel *model = shoesShortArr[indexPath.item];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            case 3:{
                babythingsShortArr = self.shortDic[@"babythingsShort"];
                babythingsShortModel *model = babythingsShortArr[indexPath.item];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            case 4:{
                toyShortArr = self.shortDic[@"toyShort"];
                toyShortModel *model = toyShortArr[indexPath.item];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            case 5:{
                womanDressShortArr = self.shortDic[@"woman_dressShort"];
                woman_dressShortModel *model = womanDressShortArr[indexPath.item];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            case 6:{
                houseShortArr = self.shortDic[@"houseShort"];
                houseShortModel *model = houseShortArr[indexPath.item];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
                }
                break;
            case 7:{
                foodShortArr = self.shortDic[@"foodShort"];
                foodShortModel *model = foodShortArr[indexPath.item];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            case 8:{
                
                beautyShortArr = self.shortDic[@"beautyShort"];
                beautyShortModel *model = beautyShortArr[indexPath.item];
                NSString *urlStr = model.img;
                [cell.mybtn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
            }
                break;
            default:
                break;
        }
        return cell;
      }else{
        ThemeItemCellFive *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ThemeItemCellFive" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor blueColor];
         switch (self.selectIndex) {
              case 1:{
                  dressArray = self.allDataDic[@"dress"];
                  DressModels *model = dressArray[indexPath.item];
                  NSString *urlStr = model.main_img;
                  [cell.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
              }
                  break;
              case 2:{
                  shoesArray = self.allDataDic[@"shoes"];
                  ShoesModels *model = shoesArray[indexPath.item];
                  NSString *urlStr = model.main_img;
                  [cell.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
              }
                  break;

              case 3:{
                  babythingsArray = self.allDataDic[@"babythings"];
                  BabythingsModels *model = babythingsArray[indexPath.item];
                  NSString *urlStr = model.main_img;
                  [cell.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
              }
                  break;

              case 4:{
                  toyArray = self.allDataDic[@"toy"];
                  ToyModels *model = toyArray[indexPath.item];
                  NSString *urlStr = model.main_img;
                  [cell.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
              }
                  break;

              case 5:{
                  womanDressArray = self.allDataDic[@"women_dress"];
                  WomanDressModels *model = womanDressArray[indexPath.item];
                  NSString *urlStr = model.main_img;
                  [cell.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
              }
                  break;

              case 6:{
                  houseArray = self.allDataDic[@"house"];
                  HouseModels *model = houseArray[indexPath.item];
                  NSString *urlStr = model.main_img;
                  [cell.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
              }
                  break;

              case 7:{
                  foodArray = self.allDataDic[@"food"];
                  FoodModels *model = foodArray[indexPath.item];
                  NSString *urlStr = model.main_img;
                  [cell.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
              }
                  break;

              case 8:{
                  beautyArray = self.allDataDic[@"beauty"];
                  BeautyModels *model = beautyArray[indexPath.item];
                  NSString *urlStr = model.main_img;
                  [cell.button sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
              }
                  break;

              default:
                  break;
          }
      
        return cell;
    }
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return CGSizeMake(310, 66);
    }else if(indexPath.section == 1){
        return CGSizeMake(152.5, 76);
    }else{
        return CGSizeMake(310, 140);
    }
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if (section == 0) {
        return UIEdgeInsetsMake(18, 5, 5, 5);
    }else{
        return UIEdgeInsetsMake(5, 5, 5, 5);
    }
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        babythingsArr = [[NSMutableArray alloc] initWithCapacity:0];
        beautyArr = [[NSMutableArray alloc] initWithCapacity:0];
        dressArr = [[NSMutableArray alloc] initWithCapacity:0];
        foodArr = [[NSMutableArray alloc] initWithCapacity:0];
        houseArr = [[NSMutableArray alloc] initWithCapacity:0];
        shoesArr = [[NSMutableArray alloc] initWithCapacity:0];
        toyArr = [[NSMutableArray alloc] initWithCapacity:0];
        womanDressArr = [[NSMutableArray alloc] initWithCapacity:0];
        
        babythingsArray = [[NSMutableArray alloc] initWithCapacity:0];
        beautyArray = [[NSMutableArray alloc] initWithCapacity:0];
        dressArray = [[NSMutableArray alloc] initWithCapacity:0];
        foodArray = [[NSMutableArray alloc] initWithCapacity:0];
        houseArray = [[NSMutableArray alloc] initWithCapacity:0];
        shoesArray = [[NSMutableArray alloc] initWithCapacity:0];
        toyArray = [[NSMutableArray alloc] initWithCapacity:0];
        womanDressArray = [[NSMutableArray alloc] initWithCapacity:0];
        
        babythingsShortArr = [[NSMutableArray alloc] initWithCapacity:0];
        beautyShortArr = [[NSMutableArray alloc] initWithCapacity:0];
        dressShortArr = [[NSMutableArray alloc] initWithCapacity:0];
        foodShortArr = [[NSMutableArray alloc] initWithCapacity:0];
        houseShortArr = [[NSMutableArray alloc] initWithCapacity:0];
        shoesShortArr = [[NSMutableArray alloc] initWithCapacity:0];
        toyShortArr = [[NSMutableArray alloc] initWithCapacity:0];
        womanDressShortArr = [[NSMutableArray alloc] initWithCapacity:0];
        [self.contentView addSubview:self.ThemeCol];
        
    }
    return self;
}


@end
