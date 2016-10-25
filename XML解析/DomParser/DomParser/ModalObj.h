//
//  ModalObj.h
//  NSXMLParser
//
//  Created by apple on 15/10/14.
//  Copyright © 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ModalObj : NSObject
/*
 * 收件人
 */
@property(nonatomic,copy)NSString *to;
/*
 * 发件人
 */
@property(nonatomic,copy)NSString *from;
/*
 * 信息标题
 */
@property(nonatomic,copy)NSString *heading;
/*
 * 信息内容
 */
@property(nonatomic,copy)NSString *body;



+ (id)modalWithDictionary:(NSDictionary *)dic;
- (id)initWithDictionary :(NSDictionary *)dic;



@end











