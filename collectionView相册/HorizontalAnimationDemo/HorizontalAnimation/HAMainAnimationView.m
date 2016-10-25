//
//  HAMainAnimationView.m
//  LetMeSpend
//
//  Created by 袁斌 on 16/5/13.
//  Copyright © 2016年 https://github.com/DefaultYuan/CustomTakePhotoAndCollectionViewAnimation. All rights reserved.
//

#import "HAMainAnimationView.h"
#import "HACollectionContanst.h"
#import "HACollectionViewCell.h"
#import "HACollectionViewFlowLayout.h"
#import "NSArray+Extension.h"
#import "UIView+Extension.h"
@interface HAMainAnimationView()<UICollectionViewDelegate, UICollectionViewDataSource,HACollectionViewFlowLayoutDelegate>
{
    //collectionView高度
    CGFloat collectionVHeight;
    NSInteger selectedIndex;
    
}
///
@property (nonatomic, strong) UIView *backgroudView;
///
@property (nonatomic, strong) UICollectionView *collectionV;
/// lable
@property (nonatomic, strong) UILabel *titleLabel;
/// button
@property (nonatomic, strong) UIButton *selectedButton;
/// closeButton
@property (nonatomic, strong) UIButton *closeButton;
@end


@implementation HAMainAnimationView

#pragma mark show
- (void)showInSuperView:(UIView *)superView
{
    CAKeyframeAnimation *popAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    popAnimation.duration = 0.25;
    popAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.1f, 0.1f, 1.0f)],
                            [NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)]];
    popAnimation.keyTimes = @[@0.2f, @1.0f];
    popAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut],
                                     [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [superView addSubview:self];
    [self.backgroudView.layer addAnimation:popAnimation forKey:nil];
}

#pragma mark dismiss
//- (void)dismiss
//{
//    CAKeyframeAnimation *hideAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    hideAnimation.duration = 0.4;
//    hideAnimation.values = @[[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0f, 1.0f, 1.0f)],
//                             [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0f, 0.0f, 1.0f)]];
//    hideAnimation.keyTimes = @[@0.2f, @0.5f, @0.75f];
//    hideAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn],
//                                      [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
//    hideAnimation.delegate = self;
//    hideAnimation.fillMode = kCAFillModeBoth;
//    hideAnimation.removedOnCompletion = NO;
//    [self.backgroudView.layer addAnimation:hideAnimation forKey:nil];
//    [self removeFromSuperview];
//}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //UIcollectionView的高度为kMainHeight-别的控件加空白的高度  减的数越大 图片越小
        selectedIndex = 0;
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        [self addsubviews];
    }
    return self;
}

#pragma mark add subview
- (void)addsubviews
{
    [self addSubview:self.backgroudView];
    [self.backgroudView addSubview:self.collectionV];
    [self.backgroudView addSubview:self.titleLabel];
    [self.backgroudView addSubview:self.selectedButton];
    [self.backgroudView addSubview:self.closeButton];
}

#pragma mark subview
-(UIView *)backgroudView
{
    if (!_backgroudView) {
        _backgroudView = [[UIView alloc] init];
        _backgroudView.backgroundColor = UIColorWithHex(0x333333);
        _backgroudView.originX = 30;
        _backgroudView.originY = 60;
        _backgroudView.width = kMainWidth - 2 * _backgroudView.originX;
        _backgroudView.height = kMainHeight - 2 * _backgroudView.originY;
        [_backgroudView cornerRadius:5
                         borderColor:[[UIColor clearColor] CGColor]
                         borderWidth:0];
        
    }
    return _backgroudView;
}
static NSString * CellIdentifier = @"UICollectionViewCell";

-(UICollectionView *)collectionV
{
    if (!_collectionV) {
        
        HACollectionViewFlowLayout *flow =[[HACollectionViewFlowLayout alloc] init];
        
        collectionVHeight = self.backgroudView.height * 0.40;
        CGFloat collectionWidth = self.backgroudView.width;
        
        //1.1.布局item,设置item的大小
        //放大后的item会放大HAZoomScale倍  所以此处需计算
        flow.itemSize = CGSizeMake(collectionVHeight / HAZoomScale * HAImageScale, collectionVHeight / HAZoomScale);
        flow.isAlpha = YES;
        flow.delegate = self;
        //1.2.设置item的间距离
        flow.minimumLineSpacing = HALineSpacing;
        //1.3 设置距离左边的距离
        CGFloat oneX =self.backgroudView.width * 0.5 - flow.itemSize.width * 0.5;
        flow.sectionInset = UIEdgeInsetsMake(0, oneX, 0, oneX);
        flow.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        //为了把阴影 显示出来 所以_collectionV 高度 +20
        _collectionV =[[UICollectionView alloc] initWithFrame:CGRectMake(0, 35, collectionWidth, collectionVHeight+20) collectionViewLayout:flow];
        _collectionV.layer.masksToBounds = YES;
        _collectionV.backgroundColor = UIColorWithHex(0x333333);
        //2.设置collectionView属性
        _collectionV.dataSource = self;
        _collectionV.delegate = self;
        _collectionV.layer.masksToBounds = YES;
        _collectionV.showsHorizontalScrollIndicator = NO;
        [_collectionV registerClass:[HACollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
    }
    return _collectionV;

}

-(UILabel *)titleLabel
{
    if (!_titleLabel) {
        CGFloat imgWidth = 150;
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake((self.backgroudView.width-imgWidth)/2, self.backgroudView.height - self.selectedButton.height - 20 - 40 - 25, imgWidth, 25)];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.numberOfLines = 1;
        _titleLabel.textColor = UIColorWithHex(0x333333);
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [_titleLabel cornerRadius:5
                      borderColor:[[UIColor clearColor] CGColor]
                      borderWidth:0];
    }
    return _titleLabel;
}

-(UIButton *)selectedButton
{
    if (!_selectedButton) {
        
        _selectedButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _selectedButton.backgroundColor = UIColorWithHex(0xF73E3E);
        [_selectedButton setTitle:@"选这个" forState:UIControlStateNormal ];
        [_selectedButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_selectedButton addTarget:self action:@selector(selectedAction) forControlEvents:UIControlEventTouchUpInside];
        _selectedButton.width = 140.0f;
        _selectedButton.height = 40.0f;
        _selectedButton.centerX = self.backgroudView.width / 2;
        _selectedButton.centerY = self.backgroudView.height - _selectedButton.height - 15.0f;
        [_selectedButton cornerRadius:_selectedButton.height / 2
                          borderColor:[[UIColor clearColor] CGColor]
                          borderWidth:0];
        
    }
    return _selectedButton;
}
-(UIButton *)closeButton
{
    if (!_closeButton) {
        _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [_closeButton setImage:[UIImage imageNamed:@"ia_message_delect"] forState:UIControlStateNormal];
        [_closeButton setBackgroundColor:[UIColor clearColor]];
        _closeButton.width = _closeButton.height = 45.0f;
        _closeButton.originY = 0;
        _closeButton.originX = self.backgroudView.width - _closeButton.width;
        [_closeButton addTarget:self
                         action:@selector(closeView)
               forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}
- (void)selectedAction
{
    if (_delegate && [_delegate respondsToSelector:@selector(didSeletedHAMainAnimationViewItem:)]) {
        HACollectItem *item = [self.dataArray objectAtIndex:selectedIndex];
        [_delegate didSeletedHAMainAnimationViewItem:item];
    }
}
- (void)closeView
{
    if (_delegate && [_delegate respondsToSelector:@selector(didCloseHAMainAnimationView)]) {
        [_delegate didCloseHAMainAnimationView];
    }
}
#pragma mark - UICollectionViewDelegate
//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HACollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    HACollectItem * model = [self.dataArray safetyObjectAtIndex:indexPath.row];
    cell.imageView.image=[UIImage imageNamed:model.img];
    
    return cell;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGPoint pInView = [self.backgroudView convertPoint:collectionView.center toView:collectionView];
    // 获取中间cell的indexPath
    NSIndexPath *indexPathNow = [collectionView indexPathForItemAtPoint:pInView];
    //如果被点击处于中间则进入点击事件,否则,把被点击cell,滑动到中间
    if (indexPath.row == indexPathNow.row) {
        
        NSLog(@"点击了该Cell");
        return;
        
    }else{
        [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
    }
}
#pragma mark - HACollectionViewFlowLayoutDelegate
- (void)collectionViewDidScrollowTo:(NSInteger)index
{
    [self labelText:index];
    selectedIndex = index;
}
- (void)labelText:(NSInteger)dex
{
    HACollectItem * model = [self.dataArray safetyObjectAtIndex:dex];
    if (![self.titleLabel.text isEqualToString:model.title]) {
        self.titleLabel.text = model.title;
    }
}
-(void)setDataArray:(NSArray<HACollectItem *> *)dataArray
{
    _dataArray = dataArray;
    [self labelText:0];
    [self.collectionV reloadData];
}

@end
