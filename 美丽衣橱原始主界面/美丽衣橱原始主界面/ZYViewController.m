//
//  ZYViewController.m
//  美丽衣橱原始主界面
//
//  Created by mac on 15-11-13.
//  Copyright (c) 2015年 ZhiYou. All rights reserved.
//

#import "ZYViewController.h"
#import "CustomLayout.h"
#import "MyCell.h"
@interface ZYViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,retain) UICollectionView *myCo;
@end

@implementation ZYViewController
- (UICollectionView *)myCo
{
    if (_myCo == nil) {
        CGRect rect = [UIScreen mainScreen].bounds;
        
        CustomLayout *layout = [CustomLayout new];
        _myCo = [[UICollectionView alloc] initWithFrame:rect collectionViewLayout:layout];
        
        [_myCo registerNib:[UINib nibWithNibName:@"MyCell" bundle:nil] forCellWithReuseIdentifier:@"MyCell"];
        
        _myCo.delegate = self;
        _myCo.dataSource = self;
    }
    return _myCo;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.view addSubview:self.myCo];
}
#pragma mark--UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 3;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    //用了return就可以不要break了
    switch (section) {
        case 0:
        {
            return 1;
        }
        case 1:{
            return 8;
        }
        case 2:{
            return 100;
        }
        default:{
            return 0;
        }
    }
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    MyCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MyCell" forIndexPath:indexPath];
    return cell;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
