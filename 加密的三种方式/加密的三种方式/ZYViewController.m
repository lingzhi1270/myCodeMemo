//
//  ZYViewController.m
//  加密的三种方式
//
//  Created by mac on 15-10-13.
//  Copyright (c) 2015年 ZhiYou. All rights reserved.
//

#import "ZYViewController.h"
#import "NSString+MD5.h"
#import "Base64.h"
#import "AESCrypt.h"
@interface ZYViewController ()

@end

@implementation ZYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    NSString *miMa = @"13534656786966666666640912993892149898293109380912839812907342174971297412090415465322548763564";
    //1.MD5加密
    //不可逆：只能加密不能解密  32位
    NSString *newMima = [miMa MD5];
    NSLog(@"===%@",newMima);
    
    /*
     2.Base64:实质为编码工具
     */
    //加密
    NSString *miMa1 = [miMa base64EncodedString];
    NSLog(@"%@",miMa1);
    NSString *miMa2 = [miMa1 base64DecodedString];
    NSLog(@"--%@",miMa2);
    
    /*
     3. AES
     */
    //加密
    NSString *miMa3 = [AESCrypt encrypt:miMa password:@"井波是傻逼"];
    NSLog(@"===%@",miMa3);
    NSString *miMa4 = [AESCrypt decrypt:miMa3 password:@"井波是傻逼"];
    NSLog(@"======%@",miMa4);
}

@end
