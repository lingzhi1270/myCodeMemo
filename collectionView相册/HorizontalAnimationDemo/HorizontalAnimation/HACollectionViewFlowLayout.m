//
//  HACollectionViewFlowLayout.m
//  LetMeSpend
//
//  Created by 袁斌 on 16/5/13.
//  Copyright © 2016年 https://github.com/DefaultYuan/CustomTakePhotoAndCollectionViewAnimation. All rights reserved.
//

#import "HACollectionViewFlowLayout.h"

@implementation HACollectionViewFlowLayout
{
    NSInteger index;
}
-(instancetype)init
{
    self = [super init];
    if (self) {
        index = 0;
        self.isAlpha = NO;
    }
    return self;
}
- (void)prepareLayout
{
    [super prepareLayout];
}
- (nullable NSArray<__kindof UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    
    //1.确定加载item的区域
    CGFloat  x = self.collectionView.contentOffset.x;
    CGFloat  y = 0;
    CGFloat  w = self.collectionView.frame.size.width;
    CGFloat  h = self.collectionView.frame.size.height;
    CGRect myrect =CGRectMake(x, y, w, h);
    
    //2.获得这个区域的item
    NSArray *original =[super layoutAttributesForElementsInRect:myrect];
    
    //遍历item,快到中间的时候放大，离开中间的时候收索
    for (UICollectionViewLayoutAttributes *atts in original) {
        //1.获得item距离左边的边框的距离
        CGFloat leftdelta = atts.center.x - self.collectionView.contentOffset.x;
        
        //2.获得屏幕的中心点
        CGFloat centerX = self.collectionView.frame.size.width * 0.5;
        //3.获得距离中心的距离
        CGFloat dela = fabs(centerX - leftdelta);
        
        //4.左边的item缩小
        CGFloat rightscale =1.00 - dela/centerX;
        
        //5.缩放
        atts.transform =CGAffineTransformMakeScale(1 + rightscale * HAMinZoomScale, 1 + rightscale * HAMinZoomScale);
        
        //6.加透明度
        if (self.isAlpha) {
            
            CGFloat dela1 = fabs(leftdelta -centerX);
            CGFloat rightscale1 = 1.00-dela1/centerX;
            
            if (rightscale1 < 0.5) {
                atts.alpha = 0.5;
            }else if(rightscale1 > 0.99){
                atts.alpha = 1;
            }else{
                atts.alpha = rightscale1;
            }
        }
        
        
    }
    NSArray * attributes = [[NSArray alloc] initWithArray:original copyItems:YES];
    
    return attributes;
}
//滚动的时候一直调用（相当于滚动间监听）
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds;
{
    CGPoint pInView = [self.collectionView.superview convertPoint:self.collectionView.center toView:self.collectionView];
    // 获取中间cell的indexPath
    NSIndexPath *indexPathNow = [self.collectionView indexPathForItemAtPoint:pInView];
    
    if (self.collectionView.contentSize.width-self.itemSize.width<newBounds.origin.x) {
        
        NSLog(@"下一页");
        
    }
    if (indexPathNow.row == 0) {
        if (newBounds.origin.x < kMainWidth / 2 ) {
            if (index != indexPathNow.row) {
                index = 0;
                if (_delegate && [_delegate respondsToSelector:@selector(collectionViewDidScrollowTo:)]) {
                    [_delegate collectionViewDidScrollowTo:index];
                }
            }
        }
    }else{
        if (index != indexPathNow.row) {
            index = indexPathNow.row;
            if (_delegate && [_delegate respondsToSelector:@selector(collectionViewDidScrollowTo:)]) {
                [_delegate collectionViewDidScrollowTo:index];
            }
        }
    }
    
    [super shouldInvalidateLayoutForBoundsChange:newBounds];
    return YES;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    //停止滚动的时候定位在中心
    //1.拿到区域内的cell
    //1.1.确定加载item的区域
    CGFloat  x = self.collectionView.contentOffset.x;
    CGFloat  y = 0;
    CGFloat  w = self.collectionView.frame.size.width;
    CGFloat  h = self.collectionView.frame.size.height;
    CGRect myrect = CGRectMake(x, y, w, h);
    
    //1.2.获得这个区域的item
    NSArray *arr =[super layoutAttributesForElementsInRect:myrect];
    
    CGFloat mindelta =MAXFLOAT;
    for (UICollectionViewLayoutAttributes *atts in arr) {
        
        //2.计算距离中心点的距离
        //1.获得item距离左边的边框的距离
        CGFloat leftdelta =atts.center.x -proposedContentOffset.x;
        //2.获得屏幕的中心点
        CGFloat centerX =self.collectionView.frame.size.width *0.5;
        //3.获得距离中心的距离
        CGFloat dela = fabs(centerX -leftdelta);
        //4.获得最小的距离
        if(dela <= mindelta)
            mindelta = centerX -leftdelta;
    }
    
    //定位在中心，注意是-号，回到之前的位置
    proposedContentOffset.x -= mindelta;
    
    //防止在第一个和最后一个 滑到中间时  卡住
    if (proposedContentOffset.x < 0) {
        proposedContentOffset.x = 0;
    }
    
    if (proposedContentOffset.x > (self.collectionView.contentSize.width - self.sectionInset.left - self.sectionInset.right - self.itemSize.width)) {
        
        proposedContentOffset.x = floor(proposedContentOffset.x);
    }
    
    return proposedContentOffset;
}

- (CGSize)collectionViewContentSize
{
    return [super collectionViewContentSize];
}

@end
