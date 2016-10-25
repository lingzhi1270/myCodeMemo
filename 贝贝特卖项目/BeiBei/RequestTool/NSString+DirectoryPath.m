//
//  NSString+DirectoryPath.m
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import "NSString+DirectoryPath.h"

@implementation NSString (DirectoryPath)
+ (NSString *)getDocumentsPath
{
    return NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)[0];
}
+ (NSString *)getTempPath
{
    return NSTemporaryDirectory();
}
+ (NSString *)getLibraryPath
{
    return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES)[0];
}
+ (NSString *)getCachesPath
{
    return NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
}
@end
