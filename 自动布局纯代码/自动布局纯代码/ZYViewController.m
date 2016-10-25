//
//  ZYViewController.m
//  自动布局纯代码
//
//  Created by mac on 15-11-12.
//  Copyright (c) 2015年 ZhiYou. All rights reserved.
//

#import "ZYViewController.h"
#import "Masonry.h"
#import "MMPlaceHolder.h"
@interface ZYViewController ()
@property (nonatomic,retain) UILabel *redLabel;
@property (nonatomic,retain) UILabel *greenLabel;
@property (nonatomic ,retain) UILabel *blueLabel;
@end

@implementation ZYViewController

- (UILabel *)redLabel
{
    if (_redLabel == nil) {
        _redLabel = [UILabel new];
        _redLabel.backgroundColor = [UIColor redColor];
        [self.view addSubview:_redLabel];
        
    }
    return _redLabel;
    
}
- (UILabel *)greenLabel
{
    if (_greenLabel == nil) {
        _greenLabel = [UILabel new];
        _greenLabel.backgroundColor = [UIColor greenColor];
        [self.view addSubview:_greenLabel];
        
    }
    return _greenLabel;
    
}
- (UILabel *)blueLabel
{
    if (_blueLabel == nil) {
        _blueLabel = [UILabel new];
        _blueLabel.backgroundColor = [UIColor blueColor];
        [self.view addSubview:_blueLabel];
    }
    return _blueLabel;
    
}



- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    [self.view showPlaceHolder];
    
    //	[self demo1];
    [self demo2];
    [self demo3];

}
- (void)demo1
{
    //make  指的是当前控件
    [self.redLabel mas_makeConstraints:^(MASConstraintMaker *make) {
      /*  //形式1:
        make.top.equalTo(self.view).offset(0);
        make.leading.equalTo(self.view).offset(0);
        make.trailing.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
      */
       /* //形式2:
        make.top.offset(0);
        make.leading.offset(0);
        make.trailing.offset(0);
        make.bottom.offset(0);
      */
        
       make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        
        
        
    }];
    
}
- (void)demo2
{
    [self.greenLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(0);
        make.width.equalTo(self.view.mas_width).multipliedBy(0.5);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.5);
        
        
        
        
        
    }];
    
    
    
}
- (void)demo3
{
    [self.blueLabel mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(self.greenLabel.mas_right);
        make.top.equalTo(self.greenLabel.mas_top);
//        make.width.equalTo(self.greenLabel.mas_width).multipliedBy(0.5);
//        make.height.equalTo(self.greenLabel.mas_height).multipliedBy(0.5);
        
        make.size.mas_equalTo(CGSizeMake(200, 200));
        
    }];
}
@end
