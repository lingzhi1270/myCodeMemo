//
//  ViewController.m
//  城市列表
//
//  Created by 蒙奇D路飞 on 16/9/19.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import "ViewController.h"
#import "CityList.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *showLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
}
- (IBAction)selectCity:(id)sender {
    CityList *cvc = [[CityList alloc]init];
    cvc.hidesBottomBarWhenPushed = YES;
    cvc.selectCity = ^(NSString *cityName){
        self.showLabel.text = [NSString stringWithFormat:@"选择的城市:%@",cityName];
    };
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:cvc];
    [self presentViewController:navi animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
