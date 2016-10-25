//
//  CustomLayout.m
//  美丽衣橱原始主界面
//
//  Created by mac on 15-11-13.
//  Copyright (c) 2015年 ZhiYou. All rights reserved.
//

#import "CustomLayout.h"

@interface CustomLayout(){
    float colHeight[2];
    CGFloat height0;
    CGFloat height1;
    CGFloat height2;
    
}
@property(nonatomic,retain) NSMutableArray *attributes;

@end
@implementation CustomLayout
- (NSMutableArray *)attributes
{
    if (_attributes == nil) {
        _attributes = [NSMutableArray new];
    }
    return _attributes;
    
}

- (void)prepareLayout
{
    [super prepareLayout];
    //获取有几个区
    NSInteger sectionNum = self.collectionView.numberOfSections;
    //collectionView的宽高
    CGFloat width = CGRectGetWidth(self.collectionView.bounds);
    CGFloat jianGe = 20;
    for (int i = 0; i < sectionNum; i ++) {
        //获取每一个区的item个数
       NSInteger itemNum = [self.collectionView numberOfItemsInSection:i];
        for (int j = 0; j < itemNum; j ++) {
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:j inSection:i];
            UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
            [self.attributes addObject:attributes];
            switch (i) {
                case 0:{
                    attributes.frame = CGRectMake(0, 0, width, 200);
                    height0 = CGRectGetMaxY(attributes.frame);
                }
                    break;
                case 1:{
                    CGFloat W = (width - 5* jianGe) / 4.0;
                    CGFloat H = W;
                    CGFloat X = jianGe + (W+jianGe) * (j%4);
                    CGFloat Y = jianGe + (H+jianGe) * (j/4);
                
                    attributes.frame = CGRectMake(X, Y + height0, W, H);
                    height1 = CGRectGetMaxY(attributes.frame);
                    
                }
                    break;
                case 2:{
                    CGFloat itemW = (width - 3 *jianGe)/2.0;
                    if (j == 0) {
                        CGFloat X = jianGe;
                        CGFloat Y = height1 + jianGe;
                        CGFloat itemH = 80;
                        attributes.frame = CGRectMake(X, Y, itemW, itemH);
                        //colHeight[0]默认初始值为0
                        colHeight[0] += itemH + jianGe;
                    }else{
                        int index = colHeight[0]<=colHeight[1]?0:1;
                        CGFloat X = jianGe + (jianGe+itemW)*index;
                        //colHeight[index]默认初始值为0
                        CGFloat Y = colHeight[index] + jianGe;
                        CGFloat itemH = 200;
                        
                        attributes.frame = CGRectMake(X, Y + height1, itemW, itemH);
                        colHeight[index] += 200 + jianGe;
                    }
                    
                }
                    break;
            }
            
            
            
        }
    }
}
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *layoutAttributes = [[NSMutableArray alloc] initWithCapacity:0];
     //遍历全的item位置,判断item的frame和rect是否相交,有重合的地方,如果有,就放入数组,返回
    for (UICollectionViewLayoutAttributes *attributes in self.attributes) {
        //判断两个矩形是否相交
        if(CGRectIntersectsRect(attributes.frame, rect)){
            [layoutAttributes addObject:attributes];
        }
    }
    return layoutAttributes;
}
- (CGSize)collectionViewContentSize
{
    
    CGFloat W = CGRectGetWidth(self.collectionView.bounds);
    
//    CGFloat H = CGRectGetHeight(self.collectionView.bounds);
    CGFloat realH = colHeight[0]>colHeight[1]?colHeight[0]:colHeight[1];
//    CGFloat realH = H>section2Height?H:section2Height;
    return CGSizeMake(W, realH + height1);
}
@end
