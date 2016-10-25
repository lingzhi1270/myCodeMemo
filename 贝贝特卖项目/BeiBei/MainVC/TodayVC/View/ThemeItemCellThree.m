//
//  ThemeItemCellThree.m
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "ThemeItemCellThree.h"
#import "Masonry.h"
#import "PromotionModel.h"
#import "UIButton+WebCache.h"


@interface ThemeItemCellThree(){
    NSMutableArray *btnCountArr;
    NSMutableArray *webArray;
}

@end
@implementation ThemeItemCellThree
//重写promotionArr的setter方法
- (void)setPromotionArr:(NSMutableArray *)promotionArr
{
    if (_promotionArr != promotionArr) {
        _promotionArr = promotionArr;
    }
       for (int i = 0; i < promotionArr.count; i ++) {
            PromotionModel *model = promotionArr[i];
            NSString *urlStr = model.img;
            UIButton *btn = btnCountArr[i];
           [webArray addObject:model];
            //button加载背景图片
            [btn sd_setBackgroundImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
       }
}
- (UIView *)promotionView
{
    if (_promotionView == nil) {
        _promotionView = [UIView new];
        _promotionView.backgroundColor = [UIColor blackColor];
//        _promotionView.frame = CGRectMake(0, 0, 310, 140);
        
        
    }
    return _promotionView;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
       
        //初始化数组
        btnCountArr = [[NSMutableArray alloc] initWithCapacity:0];
        webArray = [[NSMutableArray alloc] initWithCapacity:0];
        [self.contentView addSubview:self.promotionView];
        
        [self.promotionView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.left.offset(0);
            make.right.offset(0);
            make.bottom.offset(0);
        }];

        
        UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonOne.backgroundColor = [UIColor lightGrayColor];
        buttonOne.tag = 0;
        buttonOne.frame = CGRectMake(0, 0, 154, 140);
        [buttonOne addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.promotionView addSubview:buttonOne];
        [btnCountArr addObject:buttonOne];
        
        UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonTwo.backgroundColor = [UIColor lightGrayColor];
        buttonTwo.tag = 1;
        buttonTwo.frame = CGRectMake(156, 0, 154, 56);
        [buttonTwo addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.promotionView addSubview:buttonTwo];
        [btnCountArr addObject:buttonTwo];

        UIButton *buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonThree.backgroundColor = [UIColor lightGrayColor];
        buttonThree.frame = CGRectMake(156, 58, 154/2, 140-58);
        [buttonThree addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        buttonThree.tag = 2;
        [self.promotionView addSubview:buttonThree];
        [btnCountArr addObject:buttonThree];

        UIButton *buttonFour = [UIButton buttonWithType:UIButtonTypeCustom];
        buttonFour.backgroundColor = [UIColor lightGrayColor];
        buttonFour.tag = 3;
        buttonFour.frame = CGRectMake(154/2+156, 58, 154/2, 140-58);
        [buttonFour addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.promotionView addSubview:buttonFour];
        [btnCountArr addObject:buttonFour];

    }
    return self;
}
- (void)buttonClick:(UIButton *)button
{
        PromotionModel *model = webArray[button.tag];
        NSString *Str = model.target;
//    LZLog(@"----%@",Str);
//    LZLog(@"===%d",button.tag);
    
    if (_customDelegate != nil && [_customDelegate respondsToSelector:@selector(reloadWebViewWithBtnTag: target:)]) {
        [_customDelegate reloadWebViewWithBtnTag:button.tag target:Str];
      }
}

@end
