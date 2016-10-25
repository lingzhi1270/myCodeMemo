//
//  HACollectionViewCell.m
//  LetMeSpend
//
//  Created by 袁斌 on 16/5/13.
//  Copyright © 2016年 https://github.com/DefaultYuan/CustomTakePhotoAndCollectionViewAnimation. All rights reserved.
//

#import "HACollectionViewCell.h"

@implementation HACollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.layer.masksToBounds = NO;
        [self.contentView addSubview:self.imageView];
        self.contentView.backgroundColor = [UIColor whiteColor];
        self.contentView.layer.shadowColor = [UIColorWithHex(0x999999) CGColor];
        self.contentView.layer.shadowOpacity = 0.8;//透明度
        self.contentView.layer.shadowRadius = 2;//半径
        self.contentView.layer.shadowOffset = CGSizeMake(1, 3);
        self.contentView.layer.cornerRadius = 4;
    }
    return self;
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        //UIcollectionView的高度为kMainHeight-别的控件加空白的高度  减的数越大 图片越小
        CGFloat collectionVHeight = self.frame.size.height;
        CGFloat imgWidth = collectionVHeight / HAZoomScale * HAImageScale;
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imgWidth, collectionVHeight / HAZoomScale)];
        _imageView.center = self.contentView.center;
        _imageView.contentMode = UIViewContentModeScaleToFill;
        [_imageView setClipsToBounds:YES];
        _imageView.layer.cornerRadius = 4;
    }
    return _imageView;
}

@end
