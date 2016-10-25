//
//  ThemeItemCellTwo.m
//  BeiBei
//
//  Created by mac on 15-11-23.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "ThemeItemCellTwo.h"
#import "MyButton.h"
#import "Masonry.h"
#import "ButtonModel.h"
//给按钮下载图片导入UIButton+WebCache ！！！
#import "UIButton+WebCache.h"
@implementation ThemeItemCellTwo

- (UIButton *)lastBtn
{
    if (_lastBtn == nil) {
        _lastBtn = [UIButton new];
    }
    return _lastBtn;
    
}

//重写setter方法
- (void)setArray:(NSMutableArray *)array
{
    if (_array != array) {
        _array = array;
    }
    for (int i = 0; i < array.count; i ++) {
        ButtonModel *buttonModel = array[i];
        NSString *urlStr = buttonModel.img;
        NSString *btnTitle = buttonModel.title;
        MyButton *btn = btnCountArr[i];
//        LZLog(@"给button加图片");
        //给button加图片 和 title
         [btn sd_setImageWithURL:[NSURL URLWithString:urlStr] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"loading_leimu_failed"]];
        [btn setTitle:btnTitle forState:UIControlStateNormal];
    }
}
//重写getter方法
- (UIView *)buttonView
{
    if (_buttonView == nil) {
        _buttonView = [UIView new];
//        _buttonView.backgroundColor = [UIColor whiteColor];
    
        for (int i = 0; i < 5; i ++) {
            MyButton *button = [MyButton new];
            button.backgroundColor = [UIColor whiteColor];
                       button.tag = i + 1000;
                       //设置button图片的Mode 横屏的时候图片大小不变
                       button.imageView.contentMode = UIViewContentModeScaleAspectFit;
                    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
               [btnCountArr addObject:button];
                [_buttonView addSubview:button];
            
            WS(weakSelf);
            if (button.tag == 1000) {
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.offset(0);
                    make.top.offset(0);
                    make.bottom.offset(0);
                    make.width.equalTo(_buttonView.mas_width).multipliedBy(0.2);
                    
                }];
                self.lastBtn = button;
            }else if(button.tag == 1001){
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(weakSelf.lastBtn.mas_right).offset(0);
                    
                    make.top.offset(0);
                    make.bottom.offset(0);
                    make.width.equalTo(weakSelf.lastBtn.mas_width);
                }];
                self.lastBtn = button;
            }else if(button.tag == 1002){
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(weakSelf.lastBtn.mas_right).offset(0);
                    make.top.offset(0);
                    make.bottom.offset(0);
                    make.width.equalTo(weakSelf.lastBtn.mas_width);
                }];
                self.lastBtn = button;
            }else if(button.tag == 1003){
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(weakSelf.lastBtn.mas_right).offset(0);
                    make.top.offset(0);
                    make.bottom.offset(0);
                    make.width.equalTo(weakSelf.lastBtn.mas_width);
                }];
                self.lastBtn = button;
            }else if (button.tag == 1004){
                [button mas_makeConstraints:^(MASConstraintMaker *make) {
                    //不需要设置右边！！！三个约束已经固定
                    make.left.equalTo(self.lastBtn.mas_right).offset(0);
                    make.top.offset(0);
                    make.bottom.offset(0);
                    make.width.equalTo(weakSelf.lastBtn.mas_width);
                }];
            }
        }
    }
    return _buttonView;
}

- (void)buttonClick:(UIButton *)btn
{
    
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //初始化数组！！！！
        btnCountArr = [[NSMutableArray alloc] initWithCapacity:0];
        //把buttonView加载到cell的contentView 上
        [self.contentView addSubview:self.buttonView];
        [self.buttonView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(0);
            make.bottom.offset(0);
            make.left.offset(0);
            make.right.offset(0);
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
