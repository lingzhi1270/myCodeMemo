//
//  UIBarButtonItem+LZ.m
//  MJ
//
//  Created by mac on 15-9-24.
//  Copyright (c) 2015年 ZhiYou. All rights reserved.
//

#import "UIBarButtonItem+LZ.h"

@implementation UIBarButtonItem (LZ)
+ (UIBarButtonItem *)itemWithIcon:(NSString *)icon target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    button.frame = (CGRect){CGPointZero, button.currentBackgroundImage.size};
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:button];
 
}
@end
