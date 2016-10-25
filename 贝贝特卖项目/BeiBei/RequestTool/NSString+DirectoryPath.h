//
//  NSString+DirectoryPath.h
//  BeiBei
//
//  Created by mac on 15-11-25.
//  Copyright (c) 2015年 LingZhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (DirectoryPath)
+ (NSString *)getDocumentsPath;
+ (NSString *)getTempPath;
+ (NSString *)getLibraryPath;
+ (NSString *)getCachesPath;
@end
