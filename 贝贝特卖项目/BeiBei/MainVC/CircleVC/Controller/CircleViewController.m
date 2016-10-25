//
//  CircleViewController.m
//  BeiBei
//
//  Created by mac on 15-11-20.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "CircleViewController.h"

@interface CircleViewController ()
@property (nonatomic,strong) UISegmentedControl *seg;
@end

@implementation CircleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (UISegmentedControl *)seg
{
    if (_seg == nil) {
        _seg = [[UISegmentedControl alloc] initWithItems:@[@"关注",@"发现"]];
        //默认选中第一个
        _seg.backgroundColor = [UIColor whiteColor];
        _seg.selectedSegmentIndex = 0;
        [_seg addTarget:self action:@selector(segChange) forControlEvents:UIControlEventValueChanged];
    }
    return _seg ;
}
- (void)segChange
{
    LZLog(@"12345");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.titleView = self.seg;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
